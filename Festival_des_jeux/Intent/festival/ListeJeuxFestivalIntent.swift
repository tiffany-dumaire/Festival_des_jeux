//
//  ListeJeuxFestivalIntent.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 4/1/21.
//

import Foundation
import SwiftUI

/**
    Structure de données JeuData qui permettra de récupérer un jeu
 */
struct JeuData:Codable{
    public var idJeu:Int
    public var nomJeu:String
    public var nbJoueurMin:Int
    public var nbJoueurMax:Int
    public var ageMin:Int
    public var duree:Int
    public var lienNotice:String
    public var typeJeu:String
    public var editeur:String
}

class ListeJeuxFestivalIntent {
    @ObservedObject var listeJeuxFestival : ListeJeuxFestivalVM
    
    init(listeJeuxFestival:ListeJeuxFestivalVM){
        self.listeJeuxFestival = listeJeuxFestival
    }
    
    func loadJeux(url:String){
        self.listeJeuxFestival.state = .loading(url)
        //InOutHelper.httpGetJsonData(from: url, endofrequest: httpJsonLoaded)
        
    }
    
    func httpJsonLoaded(result: Result<[Jeu], HttpRequestError>){
        switch result{
            case let .success(data):
                self.listeJeuxFestival.state = .loaded(data)
            case let .failure(error):
                self.listeJeuxFestival.state = .loadingError(error)
        }
        
    }
    
    func listeJeuxBack() {
            let url = "https://backend-festival-app.herokuapp.com/jeu/last/allbyfestival"
            self.listeJeuxFestival.state = .loading(url)
            //call API with httJson Loaded
            LoadData.loadJeuxFestival(url: url,endofrequest: httpJsonLoaded)
        }
    
}
