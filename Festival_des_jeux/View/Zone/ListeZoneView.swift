//
//  ListeZoneView.swift
//  Festival_des_jeux
//
//  Created by user188898 on 4/2/21.
//

import SwiftUI

struct ListeZoneView: View {
    
    var jeux : [Jeu]
    
    var zones : [Zone]
    
    init(zones:[Zone]){
        self.zones = zones
        self.jeux = [Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 2, nomJeu: "Jeu 2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")]
    }
    
    @State private var text: String = ""

    @State private var isEditing = false
    
    func filterSearch(zone: Zone) -> Bool {
            
            var res: Bool = true
            
            if (!text.isEmpty) {
                res = zone.nomZone.lowercased().contains(text.lowercased())
            }
                    
            return res
        }
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image("logo")
                .resizable()
                .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
            }
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
                ForEach(self.zones.filter(filterSearch)){ zone in
                    NavigationLink(destination: ZoneView(zone: zone,jeux:self.jeux)
                   )
                    {
                        HStack{
                            VStack(alignment: .leading){
                                Text("\(zone.nomZone)")
                                    .font(.headline)
                            }
                        }
                   }
                    
                }
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


struct ListeZoneView_Previews: PreviewProvider {
    static var zones = [Zone(idZone: 2, nomZone: "Z1"),Zone(idZone: 4, nomZone: "Z2")]
    static var previews: some View {
        ListeZoneView(zones:zones)
    }
}
}
