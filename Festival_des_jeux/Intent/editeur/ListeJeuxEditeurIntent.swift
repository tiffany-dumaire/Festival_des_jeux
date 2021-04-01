//
//  ListeJeuxEditeurIntent.swift
//  Festival_des_jeux
//
//  Created by user188898 on 4/1/21.
//

import Foundation
import SwiftUI

class ListeJeuxEditeurIntent {
    
    @ObservedObject var editeurs: ListeJeuxEditeurVM
    
    init(editeurs: ListeJeuxEditeurVM){
        self.editeurs = editeurs
    }
    
    func loadEditors(url: String){
        self.editeurs.state = .loading(url)
    }
    
    func httpJsonLoaded(result: Result<[Editeur], HttpRequestError>){
        switch result{
            case let .success(data):
                self.editeurs.state = .loaded(data)
            case let .failure(error):
                self.editeurs.state = .loadingError(error)
        }
        
    }
}
