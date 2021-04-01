//
//  Jeu.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/21/21.
//

import Foundation
import Combine

class Jeu: Identifiable,ObservableObject, Decodable {
    
    private(set) var idJeu: Int
    private(set) var nomJeu: String
    private(set) var nbJoueurMin: Int
    private(set) var nbJoueurMax: Int
    private(set) var ageMin: Int
    private(set) var duree: Int
    private(set) var lienNotice: String
    private(set) var typeJeu: String
    private(set) var editeur: String
    
    /**
        Constructeur de la class Jeu
        - Parameters:
            - id : identifiant du jeu
            - nomJeu : le nom du jeu
            - nbJoueurMin : le nombre de personne minimum qu'il faut pour jouer à ce jeu
            - nbJoueurMax : le nombre maximum de personne qu'il faut pour jouer à ce jeu
            - ageMin : age minimum requis pour jouer au jeu
            - duree : Temps qu'il faut en moyenne pour finir le jeu
            - lienNotice : le lien vers les règles du jeu
            - typeJeu : type du jeu donné (jeux pour enfants, etc..)
            - editeur : l'éditeur du jeu
     */
    init(id: Int, nomJeu: String, nbJoueurMin: Int, nbJoueurMax: Int, ageMin : Int, duree: Int, lienNotice: String, typeJeu: String, editeur: String){
        self.idJeu = id
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
