//
//  ListeJeuxZone.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/21/21.
//

import SwiftUI

struct ListeJeuxZoneView: View {
    
    @ObservedObject var listeZoneVM : ListeJeuxZoneVM
    var intent : ListeJeuxZoneIntent
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

struct ListeJeuxZone_Previews: PreviewProvider {
    static var previews: some View {
        ListeJeuxZoneView()
    }
}
