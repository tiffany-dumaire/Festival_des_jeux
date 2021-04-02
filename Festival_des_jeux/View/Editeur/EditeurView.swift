//
//  EditeurView.swift
//  Festival_des_jeux
//
//  Created by user184780 on 4/2/21.
//

import SwiftUI

struct EditeurView: View {
    let editeur : Editeur
    let jeux : [Jeu]
    
    init(editeur:Editeur,jeux:[Jeu]){
        self.editeur = editeur
        self.jeux = jeux
    }
    
    var body: some View {
        HStack{
            Spacer()
            Image("logo")
            .resizable()
            .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
        }
        Text(editeur.nomEditeur).font(.title)
            .padding(.horizontal,25)
        ForEach(jeux){j in
        Text(j.nomJeu).font(.title)
            .padding(.horizontal,25)
        Text("Age minimum: " + String(j.ageMin))
        Text("Nombre de joueurs minimum: " + String(j.nbJoueurMin))
        Text("Durée: " + String(j.duree ) + " minutes")
        Text("Societe: " + String(j.editeur))
        Spacer()
        }
    }
}

struct EditeurView_Previews: PreviewProvider {
    static var e1 : Editeur = Editeur(idEditeur: 1, nomEditeur: "Editeur 1")
    static var j1 : Jeu = Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")
    static var j2 : Jeu = Jeu(id: 2, nomJeu: "Jeu 2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")
    static var jeux : [Jeu] =  [j1,j2]
    static var previews: some View {
        EditeurView(editeur: e1, jeux: jeux)
    }
}
