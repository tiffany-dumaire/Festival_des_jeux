//
//  ListeJeuxZoneIntent.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation

class ListeJeuxZoneIntent {
    @ObservedObject var jeuxZone : ListeJeuxZoneVM
    
    init(jeuxZone: ListeJeuxZoneVM){
        self.jeuxZone = jeuxZone
    }
    
    func listeJeuxBack(){
        var url = "https://backend-festival-app.herokuapp.com/jeu/last/allbyzone"
        
    }
    
    
}
