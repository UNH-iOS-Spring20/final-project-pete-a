//
//  BuyerInfoView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 2/29/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Firebase

//let db = Firestore.firestore()

struct UserInfoView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordVer: String = ""
    
    var body: some View {
        
        Form {
            Text("New User Sign up")
                .font(.largeTitle)
                .foregroundColor(Color.blue)

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
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Retype Password :")
                    .font(.headline)
                SecureField("Password", text: $passwordVer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
                .padding(.horizontal, 5)
            Button(action: {
                //addUser(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.password)
                Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, error in
                }
 
                }) {
                Text("Save")
            }
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(15)
                .background(Color.blue)
                .cornerRadius(15)
        }
    }
}

struct USerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
