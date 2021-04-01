//
//  ListeJeuxZoneIntent.swift
//  Festival_des_jeux
//
//  Created by Tiffany D & Aaron L on 3/31/21.
//

import Foundation
import SwiftUI

/**
    Structure de données ZoneData qui permettra de récupérer les zones et la liste des jeux associés
 */
struct ZoneData: Codable{
    public var idZone:Int
    public var nomZone:String
}

class ListeJeuxZoneIntent {
    
    @ObservedObject var jeuxZone : ListeJeuxZoneVM
    
    init(jeuxZone: ListeJeuxZoneVM){
        self.jeuxZone = jeuxZone
    }
    
    func loaded(listeZones:[Zone]){
        self.jeuxZone.state = .ready
    }
    
    func zoneLoaded(){
        self.jeuxZone.state = .ready
    }
    
    func httpJsonLoaded(result: Result<[Zone],HttpRequestError>){
        switch result {
            case let .success(data):
                #if DEBUG
                debugPrint("ListeJeuxZoneIntent: httpJsonLoaded -> success -> .loaded(zones)")
                #endif
                jeuxZone.state = .loaded(data)
            case let .failure(error):
                jeuxZone.state = .loadingError(error)
        }
    }
    
    func listeJeuxBack() {
            let url = "https://backend-festival-app.herokuapp.com/jeu/last/allbyzone"
            self.jeuxZone.state = .loading(url)
            //call API with httJson Loaded
            LoadData.loadZones(url: url,endofrequest: httpJsonLoaded)
        }
    
}
