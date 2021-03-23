//
//  Festival.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/23/21.
//

import Foundation

class Festival : ObservableObject {
    var _id : Int
    var nomFestival : String
    var annee : Int
    var nbTableE1 : Float
    var nbTableE2 : Float
    var nbTableE3 : Float
    var m2E1 : Float
    var m2E2 : Float
    var m2E3 : Float
    var prixE1 : Float
    var prixE2 : Float
    var prixE3 : Float
    
    /**
        Constructeur de la class Festival
        id : identifiant du festival
        nomFestival : nom du festival
        annee : correspond à l'année à laquelle le festival se déroule
        nbTableE1 : nombre de tables dans l'espace 1 du festival
        nbTableE2 : nombre de tables dans l'espace 2 du festival
        nbTableE3 : nombre de tables dans l'espace 3 du festival
        m2E1 : nombre de m^2 dans l'espace 1 du festival
        m2E2 : nombre de m^2 dans l'espace 2 du festival
        m2E3 : nombre de m^2 dans l'espace 3 du festival
        prixE1 : prix d'une table dans l'espace 1 du festival
        prixE2 : prix d'une table dans l'espace 2 du festival
        prixE3 : prix d'une table dans l'espace 3 du festival
        /!\ une table = 6m^2
     */
    init(_ id : Int, nomFestival : String, annee : Int, nbTableE1 : Float, nbTableE2 : Float, nbTableE3 : Float, m2E1 : Float, m2E2 : Float, m2E3 : Float, prixE1 : Float, prixE2 : Float, prixE3 : Float){
        self._id = id
        self.nomFestival = nomFestival
        self.annee = annee
        self.nbTableE1 = nbTableE1
        self.nbTableE2 = nbTableE2
        self.nbTableE3 = nbTableE3
        self.m2E1 = m2E1
        self.m2E2 = m2E2
        self.m2E3 = m2E3
        self.prixE1 = prixE1
        self.prixE2 = prixE2
        self.prixE3 = prixE3
    }
}
