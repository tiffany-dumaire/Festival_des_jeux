//
//  JeuView.swift
//  Festival_des_jeux
//
//  Created by user184780 on 4/2/21.
//

import SwiftUI

struct JeuView: View {
    let jeu : Jeu
    
    init(jeu:Jeu){
        self.jeu = jeu
    }
    
    var body: some View {
        HStack{
            Spacer()
            Image("logo")
            .resizable()
            .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
        }
        Text(jeu.nomJeu).font(.title)
            .padding(.horizontal,25)
        Text("Age minimum: " + String(jeu.ageMin))
        Text("Nombre de joueurs minimum: " + String(jeu.nbJoueurMin))
        Text("Durée: " + String(jeu.duree ) + " minutes")
        Text("Societe: " + String(jeu.editeur))
        Spacer()
    }
}

struct JeuView_Previews: PreviewProvider {
    static var j1 : Jeu = Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")
    static var previews: some View {
        JeuView(jeu: j1)
    }
}
