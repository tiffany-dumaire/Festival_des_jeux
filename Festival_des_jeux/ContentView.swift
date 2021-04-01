//
//  ContentView.swift
//  Festival_des_jeux
//
//  Created by Aaron L on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listeZones : ListeJeuxZoneVM   = ListeJeuxZoneVM(listeJeuxZone: ListeJeuxZone())
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
                        Text("Festival : \n").bold()
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                        Spacer()
                    }
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
                            destination: ListeJeuxZoneView(listeZoneVM: listeZones),
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
