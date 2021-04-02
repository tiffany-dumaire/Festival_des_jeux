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
    
    func filterSearch(zone: ZoneVM) -> Bool {
            
            var res: Bool = true
            
            if (!text.isEmpty) {
                res = zone.nomZone.lowercased().contains(text.lowercased())
            }
                    
            return res
        }
        
    var body: some View {
        return NavigationView{
                   VStack{
                       HStack {
                           TextField("Search", text: $text)
                               .padding(7)
                               .padding(.horizontal, 25)
                               .background(Color(.systemGray6))
                               .cornerRadius(8)
                               .padding(.horizontal, 10)
                               .onTapGesture {
                                   self.isEditing = true
                               }

                           if isEditing {
                               Button(action: {
                                   self.isEditing = false
                                   self.text = ""

                               }) {
                                   Text("Cancel")
                               }
                               .padding(.trailing, 10)
                               .transition(.move(edge: .trailing))
                               .animation(.default)
                           }
                       }

               ZStack{
                   List{
                       ForEach(self.listeZoneVM.zones.filter(filterSearch)){ zone in
                        //NavigationLink(destination: ListeZoneView()
                          // )
                          // {
                           //    ZoneRow(zone: zone)
                          // }
                           
                       }
                   }
                   if zones.count == 0{
                       VStack{
                           Spacer()
                           Text("Pas de zone disponible")
                           Spacer()
                       }
                   }
               }
                   }
               
               .navigationTitle("Zones")
           }
           .navigationViewStyle(StackNavigationViewStyle())
           }
}


struct ListeJeuxZone_Previews: PreviewProvider {
    static var previews: some View {
        ListeJeuxZoneView(listeZoneVM: ListeJeuxZoneVM(listeJeuxZone: ListeJeuxZone()))
    }
}

