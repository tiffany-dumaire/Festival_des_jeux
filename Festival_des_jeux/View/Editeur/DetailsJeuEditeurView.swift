//
//  DetailsJeuEditeur.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/21/21.
//

import SwiftUI

struct DetailsJeuEditeurView: View {
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
                Image("backgroundDetails")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailsJeuEditeur_Previews: PreviewProvider {
    static var previews: some View {
        DetailsJeuEditeurView()
    }
}
