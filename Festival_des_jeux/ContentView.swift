//
//  ContentView.swift
//  Festival_des_jeux
//
//  Created by Aaron L on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    var listeZones : [Zone]   = [Zone(idZone: 1, nomZone: "Z1"),Zone(idZone: 2, nomZone: "Z2")]
    var editeurs = [Editeur(idEditeur: 1, nomEditeur: "Editeur 1"),Editeur(idEditeur: 2, nomEditeur: "Editeur 2")]
    var jeux = [Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 2, nomJeu: "Jeu 2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")]
    
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
                    HStack{
                        Text("Festival : \nFoire Expo 2021").bold()
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxView(jeux:jeux),
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
                            destination: ListeZoneView(zones: listeZones),
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
                            destination: ListeEditeurView(editeurs:editeurs),
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
