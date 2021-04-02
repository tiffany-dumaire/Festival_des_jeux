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
    
    @State private var text: String = ""

    @State private var isEditing = false
    
    func filterSearch(jeu: Jeu) -> Bool {
            
            var res: Bool = true
            
            if (!text.isEmpty) {
                res = jeu.nomJeu.lowercased().contains(text.lowercased())
            }
                    
            return res
        }
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image("logo")
                .resizable()
                .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
            }
            HStack {
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }

                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""

                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        ZStack{
            List{
                ForEach(self.jeux.filter(filterSearch)){ jeu in
                    NavigationLink(destination: JeuView(jeu:jeu)
                   )
                    {
                        HStack{
                            VStack(alignment: .leading){
                                Text("\(jeu.nomJeu)")
                                    .font(.headline)
                            }
                        }
                   }
                    
                }
                }
            }
            if jeux.count == 0{
                VStack{
                    Spacer()
                    Text("Pas de jeu disponible")
                    Spacer()
                }
            }
        }    }
}

struct ListeJeuxView_Previews: PreviewProvider {
    static var jeux = [Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 2, nomJeu: "Jeu 2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")]
    static var previews: some View {
        ListeJeuxView(jeux: jeux)
    }
}
