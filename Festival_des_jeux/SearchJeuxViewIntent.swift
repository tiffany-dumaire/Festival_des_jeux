//
//  SearchJeuxViewIntent.swift
//  Festival_des_jeux
//
//  Created by user184780 on 3/31/21.
//

import Foundation
import Swift

class SearchJeuxViewIntent{
    
    var liste : ListeJeuxFestivalVM
    
    init(_ liste: ListeJeuxFestivalVM){
        self.liste = liste
    }
    
    func loaded(loaded: [Jeu]){
            #if DEBUG
            debugPrint("SearchIntent: \(self.liste.jeuxState) => \(loaded.count) jeux loaded")
            #endif
            self.liste.jeuxState = .ready
        }
    
    func httpJsonLoaded(result: Result<[Jeu],HttpRequestError>){
            switch result {
            case let .success(data):
                #if DEBUG
                debugPrint("SearchIntent: httpJsonLoaded -> success -> .loaded(games)")
                #endif
                if let game = gameFilter{
                    let jeux = data.filter( { jeu in jeu.nomJeu.lowercased().contains(game.lowercased()) } )
                    liste.jeuxState = .loaded(jeux)
                }
                else{
                    liste.jeuxState = .loaded(data)
                }
            case let .failure(error):
                liste.jeuxState = .loadingError(error)
            }
        }
    
    var gameFilter : String? = nil
    
    func loadPlaylist(url : String, gameFilter: String?){
            self.gameFilter = gameFilter
            #if DEBUG
            debugPrint("SearchIntent: .loading(\(url))")
            debugPrint("SearchIntent: asyncLoadJeux")
            #endif
            liste.jeuxState = .loading(url)
            if let url = URL(string:url){
                InOutHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
            }
        }
    
}
