//
//  ListeJeuxEditeurVM.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/23/21.
//

import Foundation
import SwiftUI
import Combine

enum ListeJeuxEditeurState: CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Editeur])
    case loadingError(Error)
    case new([EditeurVM])


    var description: String{
        switch self {
        case .ready : return "ready"
        case .loading(let s) : return "loading: \(s)"
        case .loaded(let editeurs) : return "loaded: \(editeurs.count) games"
        case .loadingError(let error) : return "loadingError: Error loading -> \(error)"
        case .new(let editeursVM) : return "I have my editors: \(editeursVM.count)"
        }
    }
}

class ListeJeuxEditeurVM : ObservableObject {
    
    @Published private(set) var editeurs = [EditeurVM]()
        
    @Published var state: ListeJeuxEditeurState = .ready {
        didSet {
            switch state{
                case let .loaded(data):
                    for editeur in data{
                        self.editeurs.append(EditeurVM(editeur))
                    }
                    self.state = .new(self.editeurs)
                case .loadingError:
                    print("error")
                default: return
            }
        }
    }
    
}
