//
//  ListeJeuxFestival.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct ListeJeuxFestival: View {
    //var festival : Festival
    //var jeux: [Jeu]
    
    var liste_jeux:[AnyView] = [AnyView(
                                NavigationView{
                                    VStack{
                                        Text("Jeu 1")
                                        NavigationLink(
                                            destination: DetailsJeuFestival(),
                                            label: {
                                                Text("Détails du jeu")
                                                    .bold()
                                            }).padding()
                                            .background(Color.blue)
                                            .cornerRadius(30)
                                            .foregroundColor(.white)
                            }
                        }),
                               AnyView(Text("Festival 2")),
                               AnyView(Text("Festival 3")),]
    var body: some View {
        NavigationView{
            ZStack{
                CarouselView(itemHeight: 400, views: liste_jeux)
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
    static var previews: some View {
        ListeJeuxFestival()
    }
}
