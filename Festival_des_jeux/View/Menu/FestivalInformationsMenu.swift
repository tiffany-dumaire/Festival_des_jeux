//
//  FestivalInformationsMenu.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct FestivalInformationsMenu: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    Text("Menu des informations\n             du festival :")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxFestival(),
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
                }
            }.background(
                Image("backgroundMenu")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                )
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct FestivalInformationsMenu_Previews: PreviewProvider {
    static var previews: some View {
        FestivalInformationsMenu()
    }
}
