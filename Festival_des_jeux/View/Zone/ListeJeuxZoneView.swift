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
    var liste : ListeJeuxFestival
    
    init(listeZoneVM: ListeJeuxZoneVM){
            self.listeZoneVM = listeZoneVM
        liste = ListeJeuxFestival()
            self.intent = ListeJeuxZoneIntent(jeuxZone: listeZoneVM)
        if case .ready = self.listeZoneVM.state {
            self.intent.listeJeuxBack()
    }
    }
        
    private var searchState : ListeJeuxZoneState{
            return self.listeZoneVM.state
    }
            
    private var zones : [ZoneVM] {
            return self.listeZoneVM.zones
    }
            
            
            
    @State private var text: String = ""

    @State private var isEditing = false
        
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
        ContentView()
    }
}
