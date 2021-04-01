//
//  ListeJeuxZone.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/27/21.
//

import Foundation

protocol ListeJeuxZoneDelegate {
    func newZones()
    func addZone(zone:Zone)
    func addZones(zones:[Zone])
    func zoneDeleted()
}

class ListeJeuxZone: ObservableObject {
    
    var delegate: ListeJeuxZoneDelegate?
    
    private(set) var zones = [Zone]()
    
    /**
        Nouvelle liste de zones
        - Parameters:
            - zones: liste de zone
     */
    func new(zones:[Zone]){
        self.zones = zones
        self.delegate?.newZones()
    }
    
    /**
        Ajout d'une zone à la liste
        - Parameters:
            - zone: une zone à ajouter à la liste
     */
    func add(zone:Zone){
        self.zone.append(zone)
        self.delegate?.addZone(zone:zone)
    }
    
    /**
        Ajout d'une liste de  zones à la liste
        - Parameters:
            - zones: une liste de zones à ajouter à la liste
     */
    func adds(zones: [Zone]){
        self.zones.append(contentsOf: zones)
        self.delegate?.addZones(zones:zones)
        
    }
    
    /**
        Suppression de toutes les zones de la liste
     */
    func removeZones(){
        self.zones.removeAll()
        self.delegate?.zoneDeleted()
    }
}
