//
//  ListeJeuxEditeur.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/27/21.
//

import Foundation

protocol ListeJeuxEditeurDelegate {
    func new()
    func add(editeur:Editeur)
    func adds(editeurs:[Editeur])
    func removeAll()
}

class ListeJeuxEditeur: ObservableObject {
    
    var delegate: ListeJeuxEditeurDelegate?
    
    private(set) var editeurs = [Editeur]()
    
    /**
        Nouvelle liste d'éditeurs
        - Parameters:
            - editeurs: liste d'éditeur
     */
    func new(editeurs:[Editeur]){
        self.editeurs = editeurs
        self.delegate?.new()
    }
    
    /**
        Ajout d'une zone à la liste
        - Parameters:
            - zone: une zone à ajouter à la liste
     */
    func add(editeur:Editeur){
        self.editeurs.append(editeur)
        self.delegate?.add(editeur:editeur)
    }
    
    /**
        Ajout d'une liste de  zones à la liste
        - Parameters:
            - zones: une liste de zones à ajouter à la liste
     */
    func adds(editeurs: [Editeur]){
        self.editeurs.append(contentsOf: editeurs)
        self.delegate?.adds(editeurs:editeurs)
        
    }
    
    /**
        Suppression de toutes les zones de la liste
     */
    func removeAll(){
        self.editeurs.removeAll()
        self.delegate?.removeAll()
    }
}
