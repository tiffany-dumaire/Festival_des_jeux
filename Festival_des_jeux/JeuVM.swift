//
//  JeuVM.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation
import SwiftUI

class JeuVM : Identifiable {
    
    var id = UUID()
    @ObservedObject private(set) var model:Jeu
    
    var idJeu:Int{
        return model.idJeu
    }
    
    var nomJeu:String{
        return model.nomJeu
    }
    
    var nbJoueurMin:Int{
        return model.nbJoueurMin
    }
    
    var nbJoueurMax:Int{
        return model.nbJoueurMax
    }
    
    var ageMin:Int{
        return model.ageMin
    }
    
    var duree:Int{
        return model.duree
    }
    
    var lienNotice:URL{
        return model.lienNotice
    }
    
    var typeJeu:String{
        return model.typeJeu
    }
    
    var editeur:String{
        return model.editeur
    }
    
    /**
        Initialisateur de JeuVM
        - Parameters:
            - jeu: un jeu qui servira à initialiser le model
     */
    init(jeu: Jeu){
        self.model = jeu
    }
}
