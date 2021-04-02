//
//  Editeur.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation

/**
    Structure de données EditeurData qui permettra de récupérer les éditeurs et la liste des jeux associés
 */
struct EditeurData: Codable{
    public var idSociete:Int
    public var nomSociete:String
    public var jeuxReserves:[JeuData]
    
}

class Editeur: Identifiable,ObservableObject, Decodable{
    
    private(set) var idEditeur:Int
    private(set) var nomEditeur:String
    
    /**
        Constructeur de la class Editeur
        - Parameters:
            - idEditeur : identifiant de l'éditeur
            - nomEditeur : nom de l'éditeur
            - jeuxReserves : jeux correspondant à l'éditeur
     */
    init(idEditeur:Int,nomEditeur:String){
        self.idEditeur = idEditeur
        self.nomEditeur = nomEditeur
    }
}
