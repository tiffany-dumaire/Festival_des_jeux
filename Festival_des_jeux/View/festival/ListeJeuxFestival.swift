//
//  ListeJeuxFestival.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct ListeJeuxFestival: View {
    var body: some View {
        NavigationView{
            ZStack{
                CarouselView(itemHeight: 400, views: [
                            AnyView(Text("Festival 1")),
                            AnyView(Text("Festival 2")),
                        ])
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
