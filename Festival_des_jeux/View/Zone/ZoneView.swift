//
//  ZoneView.swift
//  Festival_des_jeux
//
//  Created by user188898 on 4/2/21.
//

import SwiftUI

struct ZoneView: View {
    
    let zone : Zone
    
    init(zone:Zone){
        self.zone = zone
    }
    
    var body: some View {
        Text(zone.nomZone).font(.title)
            .padding(.horizontal,25)
    }
}

struct ZoneView_Previews: PreviewProvider {
    static var zone1: Zone = Zone(idZone: 4, nomZone: "Test")
    static var previews: some View {
        ZoneView(zone:zone1)
    }
}
