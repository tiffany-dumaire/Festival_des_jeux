//
//  ListeJeuxEditeur.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/21/21.
//

import SwiftUI

struct ListeJeuxEditeurView: View {
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
                            destination: DetailsJeuEditeurView(),
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
                Image("new")
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
        ListeJeuxEditeurView()
    }
}

