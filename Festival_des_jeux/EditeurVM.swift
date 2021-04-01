//
//  EditeurVM.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/23/21.
//

import Foundation
import SwiftUI

class EditeurVM: Identifiable{
    
    @ObservedObject private(set) var model : Editeur
    
    var idEditeur : Int{
        return model.idEditeur
    }
    
    var nomEditeur:String{
        return model.nomEditeur
    }
    
    var jeuxReserves:[Jeu]{
        return model.jeuxReserves
    }
    
    /**
        Initialisation de la classe EditeurVM
        - Parameters :
            - editeur: une instance de Editeur qui initialisera le model
     */
    init(_ editeur:Editeur){
        self.model = editeur
    }
}
