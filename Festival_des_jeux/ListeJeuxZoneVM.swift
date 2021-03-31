//
//  ListeJeuxZoneVM.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

class ListeJeuxZoneVM : ObservableObject {
    private var zone_id: String
    private var zone: String
    private var jeux: [Jeu]
    
    init(_ zone_id: String,_ zone:String,_ jeux:[Jeu]){
        self.zone_id=zone_id
        self.zone=zone
        self.jeux=jeux
    }
}
