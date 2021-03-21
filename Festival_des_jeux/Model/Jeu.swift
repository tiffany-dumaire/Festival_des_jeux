//
//  Jeu.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import Foundation

class Jeu: Identifiable,Codable {
    var _id: Int
    var nomJeu: String
    var nbJoueurMin: Int
    var nbJoueurMax: Int
    var ageMin: Int
    var duree: Int
    var lienNotice: URL
    var typeJeu: String
    var editeur: String
    
    init(id: Int, nomJeu: String, nbJoueurMin: Int, nbJoueurMax: Int, ageMin : Int, duree: Int, lienNotice: URL, typeJeu: String, editeur: String){
        self._id = id
        self.nomJeu = nomJeu
        self.nbJoueurMin = nbJoueurMin
        self.nbJoueurMax = nbJoueurMax
        self.ageMin = ageMin
        self.duree = duree
        self.lienNotice = lienNotice
        self.typeJeu = typeJeu
        self.editeur = editeur
    }
}
