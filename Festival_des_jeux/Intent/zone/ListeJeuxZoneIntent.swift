//
//  ListeJeuxZoneIntent.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation
import SwiftUI

class ListeJeuxZoneIntent {
    
    @ObservedObject var jeuxZone : ListeJeuxZoneVM
    
    init(jeuxZone: ListeJeuxZoneVM){
        self.jeuxZone = jeuxZone
    }
    
    func listeJeuxBack(){
        var url = "https://backend-festival-app.herokuapp.com/jeu/last/allbyzone"
        self.jeuxZone.state = .loading(url)        
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
    
}
