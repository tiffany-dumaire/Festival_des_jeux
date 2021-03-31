//
//  Zone.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation

class Zone: Identifiable, ObservableObject, Encodable {
    private(set) var idZone:Int
    private(set) var nomZone:String
    private(set) var jeuxReserve:[Jeu]
    
    /**
        Constructeur de la class Zone
        - Parameters:
            - idZone : identifiant de la zone
            - nomZone : nom de la zone
            - jeuxReserve : liste des jeux de la zone
     */
    init(idZone:Int,nomZone:String,jeuxReserve:[Jeu]){
        self.idZone = idZone
        self.nomZone = nomZone
        self.jeuxReserve = jeuxReserve
    }
}
