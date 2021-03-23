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
    
    /**
        Constructeur de la class Jeu
        id : identifiant du jeu
        nomJeu : le nom du jeu
        nbJoueurMin : le nombre de personne minimum qu'il faut pour jouer à ce jeu
        nbJoueurMax : le nombre maximum de personne qu'il faut pour jouer à ce jeu
        ageMin : age minimum requis pour jouer au jeu
        duree : Temps qu'il faut en moyenne pour finir le jeu
        lienNotice : le lien vers les règles du jeu
        typeJeu : type du jeu donné (jeux pour enfants, etc..)
        editeur : nom de l'éditeur du jeu
     */
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
