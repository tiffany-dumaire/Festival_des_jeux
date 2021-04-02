//
//  ListeZoneView.swift
//  Festival_des_jeux
//
//  Created by user188898 on 4/2/21.
//

import SwiftUI

struct ListeZoneView: View {
    
    var zones : [Zone]
    
    init(zones:[Zone]){
        self.zones = zones
    }
    
    var body: some View {
        ZStack{
            List{
                ForEach(self.zones){ z in
                    NavigationLink(destination: ZoneView(zone: z)){
                        Text(z.nomZone)
                    }
                }
            }
            if zones.count == 0{
                VStack{
                    Spacer()
                    Text("Aucun jeu disponible")
                    Spacer()
                }
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
