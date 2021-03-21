//
//  ContentView.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image("logo")
                    .resizable()
                        .frame(minWidth: 110, idealWidth: 110, maxWidth: 110, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .topLeading)
                    Spacer()
                }
                Spacer()
                VStack{
                    Text("Je suis un organisateur :")
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("Se connecter")
                        })
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                }
                Spacer()
                VStack{
                    Text("Je suis un visiteur :")
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("Voir les informations\ndu prochain festival")
                                .multilineTextAlignment(.center)
                        })
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                }
                Spacer()
            }
        }.background(
            Image("backgroundStartView")
                .resizable()
                .scaledToFill()
                .clipped()
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
