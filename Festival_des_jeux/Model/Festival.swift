//
//  Festival.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/23/21.
//

import Foundation

class Festival : ObservableObject {
    
    private(set) var idFestival : Int
    private(set) var nomFestival : String
    private(set) var annee : Int
    
    /**
        Constructeur de la class Festival
        - Parameters:
            - id : identifiant du festival
            - nomFestival : nom du festival
            - annee : correspond à l'année à laquelle le festival se déroule
     */
    init(idFestival : Int, nomFestival : String, annee : Int){
        self.idFestival = idFestival
        self.nomFestival = nomFestival
        self.annee = annee
    }
}
