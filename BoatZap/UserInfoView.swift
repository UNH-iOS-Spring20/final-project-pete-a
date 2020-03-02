//
//  BuyerInfoView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 2/29/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
//import Firebase

let db = Firestore.firestore()

struct UserInfoView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordVer: String = ""
    
    
    var body: some View {
        Form  {
            Section {
                Text("New User Sign up")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
            }
            VStack(alignment: .leading) {
                Text("First Name :")
                    .font(.headline)
                TextField("Enter First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Last Name :")
                    .font(.headline)
                TextField("Enter Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Email :")
                    .font(.headline)
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Password :")
                    .font(.headline)
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Retype Password :")
                    .font(.headline)
                TextField("Password", text: $passwordVer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal, 10)
            Section {
                Button(action: {}) {
                Text("Save")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(20)
                    .background(Color.blue)
                    .cornerRadius(15)
                }
            }
        }
    }
}


private func createUser() {
    let UserRef = db.collection("users")
    
    UserRef.document().setData([
        "firstName": "Peter",
        "LastName": "Aurigemma",
        "email": "pauri1@gmail.com",
        "confirmEmail": "pauri1@gmail.com",
        "buyer" : true,
        "seller" : true
        
    ])
    
    UserRef.document().setData([
        "firstName": "Jill",
        "LastName": "Moler",
        "email": "jmoler@gmail.com",
        "confirmEmail": "jmoler@gmail.com",
        "buyer" : true,
        "seller" : false
        
    ])

    UserRef.document().setData([
        "firstName": "Mike",
        "LastName": "Hall",
        "email": "mhall23@gmail.com",
        "confirmEmail": "mhall23@gmail.com",
        "buyer" : false,
        "seller" : true
        
    ])
}

struct USerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
