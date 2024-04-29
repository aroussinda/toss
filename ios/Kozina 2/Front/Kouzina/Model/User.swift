//
//  File.swift
//  Kouzina
//
//  Created by Apple Esprit on 11/12/2021.
//

import Foundation

struct User {
    
    internal init(_id: String? = nil, nom: String? = nil, email: String? = nil, password: String? = nil, image: String? = nil, role: String? = nil) {
        self._id = _id
        self.nom = nom
        self.email = email
        self.password = password
        self.image = image
        self.role = role
    }
    
    var _id : String?
    var nom : String?
    var email : String?
    var password : String?
    var image : String?
    var role : String?
}
