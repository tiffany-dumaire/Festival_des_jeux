//
//  JeuView.swift
//  Festival_des_jeux
//
//  Created by Aaron L on 4/2/21.
//

import Foundation
import SwiftUI


struct JeuView: View {
    
    let jeu : Jeu



    init(jeu: Jeu){
        self.jeu  = jeu
    }
    
    

    
    var body: some View {
        
        Text(jeu.nomJeu).font(.title)
            .padding(.horizontal,25)
        Text("Age minimum: " + String(jeu.ageMin))
        Text("Nombre de joueurs minimum: " + String(jeu.nbJoueurMin))
        Text("Durée: " + String(jeu.duree ) + " minutes")
        Text("Societe: " + String(jeu.editeur))
        Spacer()
            
    }
    
    
    
}
