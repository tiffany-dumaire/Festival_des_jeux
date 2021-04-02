//
//  ListeJeuxView.swift
//  Festival_des_jeux
//
//  Created by Aaron L on 4/2/21.
//

import Foundation
import SwiftUI
import Combine




struct ListeJeuxView: View {
    
    var jeux : [Jeu]
    
    init(jeux:[Jeu]){
        self.jeux = jeux
    }
    
    
    
    
    var body: some View {

        ZStack{
            
            if jeux.count == 0{
                VStack{
                    Spacer()
                    Text("Aucun jeu disponible")
                    Spacer()
                }
            }
        }
    }
}
