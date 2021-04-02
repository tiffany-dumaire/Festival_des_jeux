//
//  ListeEditeurView.swift
//  Festival_des_jeux
//
//  Created by user188898 on 4/1/21.
//

import SwiftUI

struct ListeEditeurView: View {
    
    var jeux : [Jeu]
    
    var editeurs : [Editeur]
    
    init(editeurs:[Editeur]){
        self.editeurs = editeurs
        self.jeux = [Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 2, nomJeu: "Jeu 2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")]
    }
    
    @State private var text: String = ""

    @State private var isEditing = false
    
    func filterSearch(editeur: Editeur) -> Bool {
            
            var res: Bool = true
            
            if (!text.isEmpty) {
                res = editeur.nomEditeur.lowercased().contains(text.lowercased())
            }
                    
            return res
        }
    
    var body: some View {
        ZStack{
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
                HStack{
                    List{
                        ForEach(self.editeurs.filter(filterSearch)){ editeur in
                            NavigationLink(destination: EditeurView(editeur: editeur,jeux:self.jeux)
                            )
                            {
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("\(editeur.nomEditeur)")
                                            .font(.headline)
                                    }
                            }
                            }
                            
                        }
                    }
                    if editeurs.count == 0{
                        VStack{
                            Spacer()
                            Text("Pas d'éditeur disponible")
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
        
    }
}

struct ListeEditeurView_Previews: PreviewProvider {
    static var e1 : Editeur = Editeur(idEditeur: 1, nomEditeur: "Editeur 1")
    static var e2 : Editeur = Editeur(idEditeur: 2, nomEditeur: "Editeur 2")
    static var editeurs = [e1,e2]
    static var previews: some View {
        ListeEditeurView(editeurs: editeurs)
    }
}
