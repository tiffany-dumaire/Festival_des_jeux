//
//  ZoneVM.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/27/21.
//

import Foundation
import SwiftUI

class ZoneVM : Identifiable{
    
    var id = UUID()
    @ObservedObject private(set) var model : Zone
    
    var idZone : Int{
        return model.idZone
    }
    
    var nomZone : String {
        return model.nomZone
    }
    
    /**
        Initialisation de la classe ZoneVM
        - Parameters :
            - zone: une instance de Zone qui initialisera le model
     */
    init(zone:Zone){
        self.model = zone
    }
}
