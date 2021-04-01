//
//  TypeJeu.swift
//  Festival_des_jeux
//
//  Created by Tiffany D & Aaron L on 4/1/21.
//

import Foundation

class TypeJeu: Decodable, ObservableObject{
    
    private(set) var idTypeJeu: Int
    private(set) var nomTypeJeu : String
    
    /**
        Constructeur de la class Zone
        - Parameters:
            - idTypeJeu : identifiant de la zone
            - nomTypeJeu : nom de la zone
     */
    init(idTypeJeu:Int,nomTypeJeu: String){
        self.idTypeJeu = idTypeJeu
        self.nomTypeJeu = nomTypeJeu
    }
}
