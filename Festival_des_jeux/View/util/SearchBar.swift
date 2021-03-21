//
//  SearchBar.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text : String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Rechercher",text: $text)
        }.padding()
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        //pour éviter les erreurs car pas de Binding<String> on met contentView dans la preview
        ContentView()
    }
}
