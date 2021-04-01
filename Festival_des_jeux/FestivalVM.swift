//
//  FestivalVM.swift
//  Festival_des_jeux
//
//  Created by Tiffany D & Aaron L on 3/27/21.
//

import Foundation
import SwiftUI

class FestivalVM: Identifiable{
    
    var id = UUID()
    @ObservedObject private(set) var model : Festival
    
    var idFestival : Int{
        return model.idFestival
    }
    
    var nomFestival:String{
        return model.nomFestival
    }
    
    var annee:Int{
        return model.annee
    }
    
    /**
        Initialisation de la classe FestivalVM
        - Parameters :
            - festival: une instance de Festival qui initialisera le model
     */
    init(festival:Festival){
        self.model = festival
    }
}
