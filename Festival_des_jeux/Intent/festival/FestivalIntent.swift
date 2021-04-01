//
//  FestivalIntent.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/31/21.
//

import Foundation
import SwiftUI

class FestivalIntent {
    
    @ObservedObject var festival : FestivalVM
    
    init(festival: FestivalVM){
        self.festival = festival
    }
    
    func listeJeuxBack(){
        var url = "https://backend-festival-app.herokuapp.com/jeu/last/allbyzone"
        
    }
    
    func loaded(listeZones:[Zone]){
    }
    
    func zoneLoaded(){
    }
    
    func httpJsonLoaded(result: Result<[Zone],HttpRequestError>){
        
    }
    
}
