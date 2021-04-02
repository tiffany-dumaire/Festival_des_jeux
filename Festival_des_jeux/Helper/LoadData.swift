//
//  LoadData.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/27/21.
//

import Foundation

/*enum HttpRequestError : Error, CustomStringConvertible{
    
    case fileNotFound(String)
    case badURL(String)
    case failingURL(URLError)
    case requestFailed
    case outputFailed
    case JsonDecodingFailed
    case JsonEncodingFailed
    case initDataFailed
    case unknown
    
    var description : String {
        switch self {
        case .badURL(let url): return "Bad URL : \(url)"
        case .failingURL(let error): return "URL error : \(error.failureURLString ?? "")\n \(error.localizedDescription)"
        case .requestFailed: return "Request Failed"
        case .outputFailed: return "Output data Failed"
        case .JsonDecodingFailed: return "JSON decoding failed"
        case .JsonEncodingFailed: return "JSON encoding failed"
        case .initDataFailed: return "Bad data format: initialization of data failed"
        case .unknown: return "unknown error"
        case .fileNotFound(let filename): return "File \(filename) not found"
        }
    }
}*/

/**
    Structure de données Festival Data qui permettra de récupérer les festivals (id,nom,annee) pour l'affichage de la Start View (ContentView.swift)
 */
struct FestivalData: Codable{
    public var idFestival:Int
    public var nomFestival:String
    public var annee:Int
}

struct EditeursData: Codable {
    public var societe: EditeurData
    public var jeuxReserves: [JeuData]
}

struct JeuxData : Codable {
    public var jeux: [JeuData]
}

struct ZonesData: Codable {
    public var zone: ZoneData
    public var jeux: [JeuData]
}


class LoadData {
    
    var resultFestival:[Festival]
    var resultsJeu: [Jeu] = []
    var resultsEditeurs: [Editeur] = []
    var resultsZone: [Zone] = []
    
    /**
        Initialisation de LoadData
     */
    init(){
        self.resultFestival = []
        self.resultsJeu = []
        self.resultsEditeurs = []
        self.resultsZone = []
    }
    
    /**
        Récupération des données du festival
        - PArameters:
            - data: tableau de FestivalData
     */
    static func festivalDetailData(data:[FestivalData]) -> [Festival]? {
        var festival = [Festival]()
        for d in data {
            let f = Festival(idFestival: d.idFestival, nomFestival: d.nomFestival, annee: d.annee)
            festival.append(f)
        }
        return festival
    }
    
    
    static func loadFestival(url surl: String, endofrequest:@escaping (Result<[Festival],HttpRequestError>) -> Void){
        guard let url = URL(string: surl) else {
            endofrequest(.failure(.badURL(surl)))
            return
        }
        self.loadFestival(url: url, endofrequest: endofrequest)
    }
    
    static func loadFestival(url: URL,  endofrequest:@escaping (Result<[Festival],HttpRequestError>) -> Void){
        self.searchFestival(url: url, endofrequest: endofrequest)
    }
    
    static func searchFestival(url: URL, endofrequest: @escaping (Result<[Festival],HttpRequestError>) -> Void){
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decodedData : Decodable?
                    decodedData = try? JSONDecoder().decode([FestivalData].self, from: data)
                guard let decodedResponse = decodedData else {
                    DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                    return
                }
                var festival : [FestivalData]
                festival = (decodedResponse as! [FestivalData])
                guard let festivals = self.festivalDetailData(data:festival) else{
                    DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                    return
                }
                DispatchQueue.main.async {
                    endofrequest(.success(festivals))
                }
            }
            else{
                DispatchQueue.main.async {
                    if let error = error {
                        guard let error = error as? URLError else {
                            endofrequest(.failure(.unknown))
                            return
                        }
                        endofrequest(.failure(.failingURL(error)))
                    }
                    else{
                        guard let response = response as? HTTPURLResponse else{
                            endofrequest(.failure(.unknown))
                            return
                        }
                        guard response.statusCode == 200 else {
                            endofrequest(.failure(.requestFailed))
                            return
                        }
                        endofrequest(.failure(.unknown))
                    }
                }
            }
        }.resume()
    }

    /**
        Récupération des données de jeux
            - Parameters:
                - data: tableau de JeuData
     */
    static func jeuDetailsData(data: [JeuData]) -> [Jeu]? {
        var jeuxFestival = [Jeu]()
        for d in data {
           // let f = Jeu(id: d.idJeu, nomJeu: d.nomJeu, nbJoueurMin: d.nbJoueurMin, nbJoueurMax: d.nbJoueurMax, ageMin: d.ageMin, duree: d.duree, lienNotice: d.lienNotice, typeJeu: d.typeJeu, editeur: d.editeur)
            //jeuxFestival.append(f)
        }
        return jeuxFestival
    }
    
    static func loadJeuxFestival(url surl: String, endofrequest: @escaping (Result<[Jeu],HttpRequestError>) -> Void){
            guard let url = URL(string: surl) else {
                endofrequest(.failure(.badURL(surl)))
                return
            }
            self.loadJeuxFestival(url: url, endofrequest: endofrequest)
        }
    
    static func loadJeuxFestival(url: URL, endofrequest: @escaping (Result<[Jeu],HttpRequestError>) -> Void){
        self.searchJeuxFestival(url:url, endofrequest:endofrequest)
    }
    
    /**
        Récupération des données de jeux par éditeur
            - Parameters:
                - data: tableau de EditeurData
     */
    static func jeuEditeurDetailsData(data:[EditeurData]) -> [Editeur]? {
        var jeuEditeurs = [Editeur]()
        //for d in data {
            
        //}
       return jeuEditeurs
    }
    
    static func jeuZoneDetailsData(data:[ZoneData]) -> [Zone]? {
        var zones = [Zone]()
        //for d in data {
            
        return zones
    }
    
    static func jeuDataOfJeu(data: [JeuData]) -> [Jeu]?{
            var jeux = [Jeu]()
            for d in data{
                
                let jeu = Jeu(id: d.idJeu, nomJeu: d.nomJeu, nbJoueurMin: d.nbJoueurMin, nbJoueurMax: d.nbJoueurMax, ageMin: d.ageMin, duree: d.duree, lienNotice: d.lienNotice, typeJeu: d.typeJeu, editeur: d.editeur)
                jeux.append(jeu)
            }
            return jeux
        }
    
    static func zonesDataOfZones(data: [ZoneData]) -> [Zone]?{
            var zones = [Zone]()
            for d in data{
                let zone = Zone(idZone: d.idZone, nomZone: d.nomZone)
                zones.append(zone)
            }
            return zones
        }
    
    static func loadZones(url surl: String, endofrequest: @escaping (Result<[Zone],HttpRequestError>) -> Void){
            guard let url = URL(string: surl) else {
                endofrequest(.failure(.badURL(surl)))
                return
            }
            self.loadZones(url: url, endofrequest: endofrequest)
        }
    static func loadZones(url: URL, endofrequest: @escaping (Result<[Zone],HttpRequestError>) -> Void){
            self.searchZonesFestival(url: url, endofrequest: endofrequest)
        }
    
    static func loadEditeurs(url surl: String, endofrequest: @escaping (Result<[Editeur],HttpRequestError>) -> Void){
            guard let url = URL(string: surl) else {
                endofrequest(.failure(.badURL(surl)))
                return
            }
            self.loadEditeurs(url: url, endofrequest: endofrequest)
        }
    
    static func loadEditeurs(url: URL, endofrequest: @escaping (Result<[Editeur],HttpRequestError>) -> Void){
            self.searchEditeurs(url: url, endofrequest: endofrequest)
        }
    
    static func editeursDataOfEditeurs(data: [EditeursData]) -> [Editeur]?{
            var editeurs = [Editeur]()
            for d in data{
                let editeur = Editeur(idEditeur: d.societe.idSociete, nomEditeur: d.societe.nomSociete)
                editeurs.append(editeur)
            }
            return editeurs
        }
    
    static func searchEditeurs(url: URL, endofrequest: @escaping (Result<[Editeur],HttpRequestError>) -> Void){
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decodedData : Decodable?
                    
                    
                        decodedData = try? JSONDecoder().decode([EditeursData].self, from: data)
                    
                    guard let decodedResponse = decodedData else {
                        DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                        return
                    }
                    
                    var editeursData : [EditeursData]
                    
                    editeursData = (decodedResponse as! [EditeursData])
                    
                    
                    
                    guard let editeurs = self.editeursDataOfEditeurs(data: editeursData) else{
                        DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                        return
                    }
                    DispatchQueue.main.async {
                        endofrequest(.success(editeurs))
                    }
                }
                else{
                    DispatchQueue.main.async {
                        if let error = error {
                            guard let error = error as? URLError else {
                                endofrequest(.failure(.unknown))
                                return
                            }
                            endofrequest(.failure(.failingURL(error)))
                        }
                        else{
                            guard let response = response as? HTTPURLResponse else{
                                endofrequest(.failure(.unknown))
                                return
                            }
                            guard response.statusCode == 200 else {
                                endofrequest(.failure(.requestFailed))
                                return
                            }
                            endofrequest(.failure(.unknown))
                        }
                    }
                }
            }.resume()
        }
    
    static func searchJeuxFestival(url: URL, endofrequest: @escaping (Result<[Jeu],HttpRequestError>) -> Void){
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decodedData : Decodable?
                    decodedData = try? JSONDecoder().decode([JeuData].self, from: data)
                guard let decodedResponse = decodedData else {
                    DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                    return
                }
                var jeuxFestival : [JeuData]
                jeuxFestival = (decodedResponse as! [JeuData])
                guard let jeux = self.jeuDetailsData(data:jeuxFestival) else{
                    DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                    return
                }
                DispatchQueue.main.async{
                   endofrequest(.success(jeux))
                }
            }
            else{
                DispatchQueue.main.async {
                    if let error = error {
                        guard let error = error as? URLError else {
                            endofrequest(.failure(.unknown))
                            return
                        }
                        endofrequest(.failure(.failingURL(error)))
                    }
                    else{
                        guard let response = response as? HTTPURLResponse else{
                            endofrequest(.failure(.unknown))
                            return
                        }
                        guard response.statusCode == 200 else {
                            endofrequest(.failure(.requestFailed))
                            return
                        }
                        endofrequest(.failure(.unknown))
                    }
                }
            }
        }.resume()
    }
    static func searchZonesFestival(url: URL, endofrequest: @escaping (Result<[Zone],HttpRequestError>) -> Void){
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decodedData : Decodable?
                        decodedData = try? JSONDecoder().decode([ZoneData].self, from: data)
                    
                    guard let decodedResponse = decodedData else {
                        DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                        return
                    }
                    
                    var zonesData : [ZoneData]
                    
                    zonesData = (decodedResponse as! [ZoneData])

                    guard let zones = self.zonesDataOfZones(data: zonesData) else{
                        DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                        return
                    }
                    DispatchQueue.main.async {
                        endofrequest(.success(zones))
                    }
                }
                else{
                    DispatchQueue.main.async {
                        if let error = error {
                            guard let error = error as? URLError else {
                                endofrequest(.failure(.unknown))
                                return
                            }
                            endofrequest(.failure(.failingURL(error)))
                        }
                        else{
                            guard let response = response as? HTTPURLResponse else{
                                endofrequest(.failure(.unknown))
                                return
                            }
                            guard response.statusCode == 200 else {
                                endofrequest(.failure(.requestFailed))
                                return
                            }
                            endofrequest(.failure(.unknown))
                        }
                    }
                }
            }.resume()
        }
}
