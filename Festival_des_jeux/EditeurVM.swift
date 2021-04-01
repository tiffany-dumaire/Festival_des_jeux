//
//  EditeurVM.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/31/21.
//

import Foundation
import SwiftUI

class EditeurVM: Identifiable{
    
    var id = UUID()
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
    init(editeur:Editeur){
        self.model = editeur
    }
}
