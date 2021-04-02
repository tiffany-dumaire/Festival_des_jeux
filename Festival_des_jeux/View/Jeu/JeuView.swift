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
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image("logo")
                    .resizable()
                    .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
                }
                Spacer()
                HStack{
                    VStack{
                        HStack{
                            Text(jeu.nomJeu)
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Text("Age minimum: " + String(jeu.ageMin))
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Text("Nombre de joueurs minimum: " + String(jeu.nbJoueurMin))
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Text("Durée: " + String(jeu.duree ) + " minutes")
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Text("Societe: " + String(jeu.editeur))
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(30)
                    .background(Color.white)
                    .cornerRadius(30)
                }
                Spacer()
                
            }.background(
                Image("backgroundDetails")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct JeuView_Previews: PreviewProvider {
    static var j1 : Jeu = Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")
    static var previews: some View {
        JeuView(jeu: j1)
    }
}
