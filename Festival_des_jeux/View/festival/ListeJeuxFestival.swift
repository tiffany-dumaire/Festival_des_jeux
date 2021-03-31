//
//  ListeJeuxFestival.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct ListeJeuxFestival: View {
    
    @ObservedObject var listeJeuxFestival: ListeJeuxFestivalVM
    //var jeux: [Jeu]
    
    var body: some View {
        NavigationView{
            ZStack{
                CarouselView(itemHeight: 500, views: listeJeuxFestival.listeJeux())
                VStack{
                    HStack{
                        Spacer()
                        Image("logo")
                        .resizable()
                        .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
                    }
                    Spacer()
                }
            }.background(
                Image("backgroundList")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ListeJeuxFestival_Previews: PreviewProvider {
    static var jeux = [Jeu(id: 1, nomJeu: "Jeu1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 2, nomJeu: "Jeu2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 3, nomJeu: "Jeu3", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur")]
    static var liste = ListeJeuxFestivalVM(jeux)
    static var previews: some View {
        ListeJeuxFestival(listeJeuxFestival: liste)
    }
}
