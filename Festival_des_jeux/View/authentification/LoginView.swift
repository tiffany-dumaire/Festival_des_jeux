//
//  LoginView.swift
//  Festival_des_jeux
//
//  Created by Tiffany D on 3/21/21.
//  Vue correspondant à la page de connexion

import SwiftUI

struct LoginView: View {
    
    @State var mail : String = ""
    @State var password : String = ""
    @State var admin = false
    @State var error = false
    
    // Fonction de connexion, si le login ne réussit pas on exécute cette fonction qui passe error à true.
    func login(){
        error = true
    }
    
    var body : some View {
        VStack{
            Text("Connexion")
            error ?
                Text("Veuillez saisir un mail ou un mot de passe correct")
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                : nil
            HStack {
                Text("Email :")
                TextField("Email", text : $mail)
                    .cornerRadius(10)
            }.padding()
            HStack{
                Text("Mot de passe :")
                SecureField("mot de passe...", text: $password)
                    .cornerRadius(10)
            }.padding()
            
            Button(action:self.login){
                Text("Se connecter")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
