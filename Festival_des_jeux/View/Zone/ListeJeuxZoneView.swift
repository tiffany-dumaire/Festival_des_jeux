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
                           Button(action: {
                                   self.intent.listeJeuxBack()}){
                               Label("", systemImage: "arrow.clockwise")
                                   .padding(15)
                           }
                           TextField("Rechercher ...", text: $text)
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
                                   Text("Annuler")
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
                           Text("Aucune zone disponible")
                           Spacer()
                       }
                   }
                   ErrorViewZone(state: searchState)
               }
                   }
               
               .navigationTitle("Zones")
           }
           .navigationViewStyle(StackNavigationViewStyle())
           }
}

struct ZoneRow : View{
    let zone : ZoneVM
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text("\(zone.nomZone)")
                    .font(.headline)
            }
        }
    }
}

struct ErrorViewZone : View{
    let state : ListeJeuxZoneState
    var body: some View{
        VStack{
            Spacer()
            switch state{
            case .loading, .loaded:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(3)
            case .loadingError(let error):
                Text("Error!")
            default:
                EmptyView()
            }
            if case let .loaded(data) = state{
                Text("\(data.count) zones trouvées!")
            }
            Spacer()
        }
    }

struct ListeJeuxZone_Previews: PreviewProvider {
    static var previews: some View {
        ListeJeuxZoneView(listeZoneVM: ListeJeuxZoneVM(listeJeuxZone: ListeJeuxZone()))
    }
}
}
