//
//  ListeJeuxFestivalVM.swift
//  Festival_des_jeux
//
//  Created by Tiffany D & Aaron L on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

class ListeJeuxFestivalVM : ObservableObject {
    
    enum SearchJeuxState : CustomStringConvertible{
        case ready
        case loading(String)
        case loaded([Jeu])
        case loadingError(Error)

        var description: String{
            switch self {
            case .ready                               : return "ready"
            case .loading(let s)                      : return "loading: \(s)"
            case .loaded(let jeux)                  : return "loaded: \(jeux.count) jeux"
            case .loadingError(let error)             : return "loadingError: Error loading -> \(error)"
            }
        }
        
    }
    
    @Published private var jeux:[Jeu]
    
    @Published var formViewOpen = false
    
    @Published var jeuxState : SearchJeuxState = .ready{
        didSet{
            #if DEBUG
            debugPrint("SearchPlvm : state.didSet = \(jeuxState)")
            #endif
            switch self.jeuxState { // state has changed
            case let .loaded(data):    // new data has been loaded, to change all games of list
                self.formViewOpen = false // close searchFormView, new games have been found
                #if DEBUG
                debugPrint("SearchJFVM: jeux loaded => formViewOpen=\(formViewOpen) -> model.new(jeux:)")
                #endif
                self.jeux = data
            case .loadingError:
                self.formViewOpen = true // reopen or keep open searchFormView as there is an error on loading new games
            default:                   // nothing to do for ViewModel, perhaps for the view
                return
            }
        }
    }
    
    init(){
        self.jeux=[]
    }
    
    init(_ jeux:[Jeu]){
        self.jeux = jeux
    }
    
    func listeJeux() -> [AnyView]{
        var res:[AnyView] = []
        if self.jeux.count>0{
            for j in self.jeux{
                let cur = AnyView(
                NavigationView{
                    Text(j.nomJeu)
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
