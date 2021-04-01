//
//  MainView.swift
//  Festival_des_jeux
//  (Ne sera pas utilisé car finalement pas de login)
//
//  Created by Tiffany D on 3/24/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    HStack{
                        Image("logo")
                        .resizable()
                            .frame(minWidth: 110, idealWidth: 110, maxWidth: 110, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .topLeading)
                    
                    }
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
                            destination: FestivalInformationsMenu(),
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
