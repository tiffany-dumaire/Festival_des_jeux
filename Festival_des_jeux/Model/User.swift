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
    
    init(id: Int, mail:String, password:String, admin: Bool){
        self._id = id
        self.mail = mail
        self.password = password
        self.admin = admin
        self.userToken = ""
    }
    
    static func connexionUser(id : String){

    }
}
