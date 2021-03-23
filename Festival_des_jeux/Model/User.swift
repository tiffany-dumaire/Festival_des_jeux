//
//  User.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import Foundation

class User: Identifiable,Codable {
    var _id: Int
    var mail: String
    var password: String
    var admin: Bool
    var userToken: String
    
    /**
        Constructeur de la class user
        id : identifiant
        mail : adresse mail de l'utilisateur
        password : mot de passe
        admin : True si c'est un grand manitou, False si c'est un organisateur
     */
    init(id: Int, mail:String, password:String, admin: Bool){
        self._id = id
        self.mail = mail
        self.password = password
        self.admin = admin
        self.userToken = ""
    }
    
    /**
        Connexion de l'utilisateur à partir de ses identifiants
        mail : son adresse mail
        password : son mot de passe
     */
    static func connexionUser(mail : String, password : String){
         
    }
    
    /**
        Crée un nouvel utilisateur dans la base de données
        mail : adresse email de l'utilisateur
        password : mot de passe de l'utilisateur
        admin :  true = compte grand manitou, false = compte organisateur
     */
    static func signUpUser(mail: String,password : String, admin : Bool){
        
    }
}
