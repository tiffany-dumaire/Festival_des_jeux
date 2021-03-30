//
//  ContentView.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    var f1 = Festival(1, nomFestival: "Festival1", annee: 2021, nbTableE1: 10.0, nbTableE2: 10.0, nbTableE3: 10.0, m2E1: 100, m2E2: 100, m2E3: 100, prixE1: 50, prixE2: 30, prixE3: 20)

    var jeux = [Jeu(id: 1, nomJeu: "Jeu1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 2, nomJeu: "Jeu2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 3, nomJeu: "Jeu3", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur")]
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Image("logo")
                        .resizable()
                        .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
                    }
                    Text("Festival :\nnom du festival")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxFestival(listeJeuxFestival: ListeJeuxFestivalVM(f1,jeux)),
                            label: {
                                Text("Liste des jeux du Festival")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxZone(),
                            label: {
                                Text(" Liste des jeux par Zone ")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxEditeur(),
                            label: {
                                Text("Liste des jeux par Editeur")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.background(
                    Image("backgroundStartView")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                    )
                .edgesIgnoringSafeArea(.all)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
