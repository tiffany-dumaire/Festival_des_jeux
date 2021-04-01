//
//  ListeJeuxZoneVM.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

enum ListeJeuxZoneState{
    case ready
    case loading(String)
    case loaded([Zone])
    case loadingError(Error)

    var description: String{
        switch self {
        case .ready                               : return "ready"
        case .loading(let s)                      : return "loading: \(s)"
        case .loaded(let zones)                  : return "loaded: \(zones.count) zones"
        case .loadingError(let error)             : return "loadingError: Error loading -> \(error)"
        }
    }
}


class ListeJeuxZoneVM : ObservableObject {
    
    private(set) var model : ListeJeuxZone
    @Published private(set) var zones = [ZoneVM]()
    @Published var state : ListeJeuxZoneState = .ready {
        didSet{
            #if DEBUG
            debugPrint("Problème listeJeuZoneVM : state.didSet = \(state)")
            #endif
            switch self.state {
                case let .loaded(data): self.model.new(zones:data)
                case .loadingError: print("ERROR")
                default:
                    return
            }
        }
    }
    
    /**
        Initialisation de ListeJeuxZoneVM
        - Parameters:
            - listeJeuxZone: liste qui deviendra le model du view model
     */
    init(listeJeuxZone: ListeJeuxZone){
        self.model = listeJeuxZone
        self.model.delegate = self
    }
    
    func new(zones: [Zone]){
        #if DEBUG
        debugPrint("Probleme listeJeuxZoneVM : model.new(zones) - \(zones.count) zones")
        #endif
        self.model.new(zones:zones)
    }
    
    func adds(zones:[Zone]){
        self.model.adds(zones:zones)
    }
    
}
