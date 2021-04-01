//
//  ListeJeuxFestival.swift
//  Festival_des_jeux
//
//  Created by Aaron L & Tiffany D on 3/21/21.
//

import SwiftUI

struct ListeJeuxFestivalView: View {
    
    //@ObservedObject var listeJeuxFestival: ListeJeuxFestivalVM
    //var jeux: [Jeu]
    
    var body: some View {
        NavigationView{
            ZStack{
                //CarouselView(itemHeight: 500, views: listeJeuxFestival.listeJeux())
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
                Image("new")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ListeJeuxFestival_Previews: PreviewProvider {
    static var previews: some View {
        ListeJeuxFestivalView()
    }
}
