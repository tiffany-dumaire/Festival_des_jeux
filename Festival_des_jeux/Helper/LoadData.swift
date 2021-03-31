//
//  LoadData.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
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
    Structure de données JeuData qui permettra de récupérer un jeu
 */
struct JeuData:Codable{
    public var idJeu:Int
    public var nomJeu:String
    public var nbJoueurMin:Int
    public var nbJoueurMax:Int
    public var ageMin:Int
    public var duree:Int
    public var lienNotice:URL
    public var typeJeu:String
    public var editeur:String
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
    
    init(){
        self.resultFestival = []
        self.resultsJeu = []
        self.resultsEditeurs = []
        self.resultsZone = []
    }
    
    static func jeuDetailsData(data: [JeuData]) -> [Jeu]? {
        var jeuxFestival = [Jeu]()
        for d in data {
            let f = Jeu(id: d.idJeu, nomJeu: d.nomJeu, nbJoueurMin: d.nbJoueurMin, nbJoueurMax: d.nbJoueurMax, ageMin: d.ageMin, duree: d.duree, lienNotice: d.lienNotice, typeJeu: d.typeJeu, editeur: d.editeur)
            jeuxFestival.append(f)
        }
        return jeuxFestival
    }
    
    static func jeuEditeurDetailsData(data:[EditeurData]) -> [Editeur]? {
        var jeuEditeurs = [Editeur]()
        for d in data {
            
        }
        return jeuEditeurs
    }
    
}
