//
//  ListeJeuxEditeurVM.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

class ListeJeuxEditeurVM : ObservableObject {
    private var festival:Festival
    private var editeur_id:String
    private var editeur: String
    private var jeux:[Jeu]
    
    init(_ festival:Festival,_ editeur_id:String,_ editeur:String,_ jeux: [Jeu]){
        self.festival = festival
        self.editeur_id = editeur_id
        self.editeur = editeur
        self.jeux = jeux
    }
}
