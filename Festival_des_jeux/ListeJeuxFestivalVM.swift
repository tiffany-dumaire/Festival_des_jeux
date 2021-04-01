//
//  ListeJeuxFestivalVM.swift
//  Festival_des_jeux
//
//  Created by Aaron L on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

enum SearchJeuxState : CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Jeu])
    case loadingError(Error)

    var description: String{
        switch self {
        case .ready                               : return "ready"
        case .loading(let s)                      : return "loading: \(s)"
        case .loaded(let jeux)                    : return "loaded: \(jeux.count) jeux"
        case .loadingError(let error)             : return "loadingError: Error loading -> \(error)"
        }
    }
    
}


class ListeJeuxFestivalVM : ObservableObject {
    
    private(set) var model: ListeJeuxFestival
    
    @Published private var jeux:[JeuVM]
    
    @Published var formViewOpen = false
    
    @Published var state : SearchJeuxState = .ready{
        didSet{
            #if DEBUG
            debugPrint("ListeJeuxFestivalVM : state.didSet = \(state)")
            #endif
            switch self.state { // state has changed
            case let .loaded(data):    // new data has been loaded, to change all games of list
                self.model.new(jeux:data)
            case .loadingError:
                print("Error")
            default:                   // nothing to do for ViewModel, perhaps for the view
                return
            }
        }
    }
    
    init(_ jeux: ListeJeuxFestival){
        self.model = jeux
        self.jeux = []
    }
    
    func listeJeux() -> [AnyView]{
        var res:[AnyView] = []
        if self.jeux.count>0{
            for j in self.jeux{
                let cur = AnyView(
                NavigationView{
                    VStack{
                        Text("Nom du jeu : \(j.nomJeu)")
                        Text("Nombre de joueur allant de \(j.nbJoueurMin) à \(j.nbJoueurMax)")
                        Text("Age minimum requis : \(j.ageMin)")
                        Text("Durée du jeu : \(j.duree)h")
                        Text("Lien vers la notive :\(j.lienNotice)")
                    }
                    Spacer()
                })
                res.append(cur)
            }
        }else{
            res.append(AnyView(Text("Pas de jeux trouvés")))
        }
        return res
    }
}
