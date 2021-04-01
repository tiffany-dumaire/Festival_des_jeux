//
//  FestivalInformationsMenu.swift
//  Festival_des_jeux
//
//  Created by Tiffany D & Aaron L on 3/21/21.
//

import SwiftUI

struct FestivalInformationsMenu: View {    
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
                        .foregroundColor(Color.white)
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxFestivalView(),
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
                            destination: ListeJeuxZoneView(),
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
                            destination: ListeJeuxEditeurView(),
                            label: {
                                Text("Liste des jeux par Editeur")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.background(Color(red:0/255,green:0/255,blue:0/255,opacity:0.3))
            }.background(
                Image("background")
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
