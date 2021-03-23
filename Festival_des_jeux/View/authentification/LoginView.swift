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
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Image("logo")
                    .resizable()
                    .frame(minWidth: 110, idealWidth: 110, maxWidth: 110, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
                }
                Text("Connexion")
                    .font(.largeTitle)
                    .bold()
                
                error ?
                    Text("Veuillez saisir un mail ou un mot de passe correct")
                    .padding()
                    .background(Color(red: 255/255, green: 0/255, blue: 0/255,opacity: 0.6))
                    .cornerRadius(10)
                    : nil
                
                HStack {
                    Text("Email :")
                        .bold()
                    TextField("Email", text : $mail)
                        .cornerRadius(10)
                }.padding()
                
                HStack{
                    Text("Mot de passe :")
                        .bold()
                    SecureField("mot de passe...",text: $password)
                        .cornerRadius(10)
                }.padding()
                
                Button(action:self.login){
                    Text("Se connecter")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                Spacer()
            }.background(Color.white
                            .opacity(0.4))
        }.background(
            Image("background")
                .resizable()
                .scaledToFill()
                .clipped()
        )
        .edgesIgnoringSafeArea(.all)
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
