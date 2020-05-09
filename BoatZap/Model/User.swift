//
//  User.swift
//  UserZap
//
//  Created by Peter Aurigemma on 5/7/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import FirebaseFirestore

class User : FirebaseCodable {
    
    var id: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var password: String
   
    
    var data: [String: Any] {
        return [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password,
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let firstName = data["firstName"] as? String,
            let lastName = data["lastName"] as? String,
            let email = data["email"] as? String,
            let password = data["password"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        
    }
    
    #if DEBUG
    static let example = User(id: "1", data: ["firstName": "First Name",
                                              "lastName": "lastName",
                                              "email": "email",
                                              "password": "password",
                                            ])!
    #endif
}
