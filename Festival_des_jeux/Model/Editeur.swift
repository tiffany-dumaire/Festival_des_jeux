//
//  Editeur.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation

class Editeur: Identifiable, ObservableObject, Encodable{
    
    private(set) var idEditeur:Int
    private(set) var nomEditeur:String
    private(set) var jeuxReserves:[Jeu]
    
    /**
        Constructeur de la class Editeur
        - Parameters:
            - idEditeur : identifiant de l'éditeur
            - nomEditeur : nom de l'éditeur
            - jeuxReserves : jeux correspondant à l'éditeur
     */
    init(idEditeur:Int,nomEditeur:String,jeuxReserves:[Jeu]){
        self.idEditeur = idEditeur
        self.nomEditeur = nomEditeur
        self.jeuxReserves = jeuxReserves
    }
}
