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
