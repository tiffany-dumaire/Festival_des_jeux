//
//  ListeJeuxEditeurVM.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

class ListeJeuxEditeurVM : ObservableObject {
    private var editeur_id:String
    private var editeur: String
    private var jeux:[Jeu]
    
    init(_ editeur_id:String,_ editeur:String,_ jeux: [Jeu]){
        self.editeur_id = editeur_id
        self.editeur = editeur
        self.jeux = jeux
    }
}
