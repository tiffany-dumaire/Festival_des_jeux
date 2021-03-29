//
//  ListeJeuxFestivalVM.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

class ListeJeuxFestivalVM : ObservableObject {
    
    @Published private var festival: Festival
    @Published private var jeux:[Jeu]
    
    init(){
        self.festival = Festival.init()
        self.jeux=[]
    }
    
    init(_ festival: Festival,_ jeux:[Jeu]){
        self.festival = festival
        self.jeux = jeux
    }
}
