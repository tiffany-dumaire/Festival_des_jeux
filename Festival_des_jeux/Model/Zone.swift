//
//  Zone.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation

class Zone: Identifiable, ObservableObject, Decodable {
    
    private(set) var idZone:Int
    private(set) var nomZone:String
    
    /**
        Constructeur de la class Zone
        - Parameters:
            - idZone : identifiant de la zone
            - nomZone : nom de la zone
     */
    init(idZone:Int,nomZone:String){
        self.idZone = idZone
        self.nomZone = nomZone
    }
}
