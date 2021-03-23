//
//  ListeJeuxEditeur.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct ListeJeuxEditeur: View {
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
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: DetailsJeuEditeur(),
                            label: {
                                Text("Details des jeux")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
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

struct ListeJeuxEditeur_Previews: PreviewProvider {
    static var previews: some View {
        ListeJeuxEditeur()
    }
}

