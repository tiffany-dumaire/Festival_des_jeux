//
//  LoadData.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/27/21.
//

import Foundation

/**
    Structure de données Festival Data qui permettra de récupérer les festivals (id,nom,annee) pour l'affichage de la Start View (ContentView.swift)
 */
struct FestivalData:Codable{
    public var idFestival:Int
    public var nomFestival:String
    public var anneeFestival:Int
}

/**
    Structure de données ZoneData qui permettra de récupérer les zones et la liste des jeux associés
 */
struct ZoneData:Codable{
    public var idZone:Int
    public var nomZone:String
    public var jeuxReserves:[JeuData]
}

/**
    Structure de données EditeurData qui permettra de récupérer les éditeurs et la liste des jeux associés
 */
struct EditeurData:Codable{
    public var idSociete:Int
    public var nomSociete:String
    public var jeuxReserves:[JeuData]
    
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
        Récupération des données de jeux
            - Parameters:
                - data: tableau de JeuData
     */
    static func jeuDetailsData(data: [JeuData]) -> [Jeu]? {
        var jeuxFestival = [Jeu]()
        for d in data {
            let f = Jeu(id: d.idJeu, nomJeu: d.nomJeu, nbJoueurMin: d.nbJoueurMin, nbJoueurMax: d.nbJoueurMax, ageMin: d.ageMin, duree: d.duree, lienNotice: d.lienNotice, typeJeu: d.typeJeu, editeur: d.editeur)
            jeuxFestival.append(f)
        }
        return jeuxFestival
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
        //var jeuEditeurs = [Editeur]()
        //for d in data {
            
        //}
       // return jeuEditeurs
    }
    
    static func jeuZoneDetailsData(data:[ZoneData]) -> [Zone]? {
        //var zones = [Zone]()
        //for d in data {
            
        //}
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
                guard let jeux = self.loadJeuxFestival(data: jeuxFestival) else{
                    DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                    return
                }
                DispatchQueue.main.async {
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
}
