//
//  ListeJeuxFestival.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/27/21.
//

import Foundation

protocol ListeJeuxFestivalDelegate {
    func new()
    func add(jeu:Jeu)
    func adds(jeux: [Jeu])
    func removeAll()
}


class ListJeux : ObservableObject{
        
    var delegate : ListJeuxDelegate?
    
    private(set) var jeuxFestival = [Jeu]()
    
    /**
        Création d'une nouvelle liste de jeu
        - Parameters:
            - jeux: nouvelle liste de jeux
     */
    func new(jeux: [Jeu]){
        self.jeuxFestival = jeux
        print(jeux[0])
        self.delegate?.new()
    }

    /**
        Ajout d'un jeu à la liste
        - Parameters:
            - jeu: une jeu à ajouter à la liste
     */
    func add(jeu: Jeu){
        self.jeuxFestival.append(jeu)
        self.delegate?.add(jeu: jeu)
    }
    
    /**
        Ajout d'une liste de jeux à la liste
        - Parameters:
            - jeux: une liste de jeux à ajouter à la liste
     */
    func adds(jeux: [Jeu]){
        self.jeuxFestival.append(contentsOf: jeux)
        self.delegate?.adds(jeux: jeux)
    }
    
    /**
        Suppression de tous les jeux de la liste
     */
    func removeAll(){
        self.jeuxFestival.removeAll()
        self.delegate?.removeAll()
    }
}
