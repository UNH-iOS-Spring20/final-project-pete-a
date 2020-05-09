//
//  BuyerInfoView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 2/29/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import Firebase
//import FirebaseUI
import UIKit

struct NewUserSignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordVer: String = ""
    
    var body: some View {
        
        VStack {
            Text("Sign up")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
            
            VStack(alignment: .leading) {
                Group{
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
                Button (action: {
                    self.addUser()
                }) {
                    Text("Save")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                    
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(15)
                .background(Color.blue)
                .cornerRadius(15)
            }
            .padding()
            Spacer()
        }
        
    }
    
    func addUser() {
        let data = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
        ]
        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty && !passwordVer.isEmpty {
        }
        if (self.password == self.passwordVer) {
            print(" password1 = ",self.password)
            print(" password2 = ",self.passwordVer)
            Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, error in
            }
            print("------ reference ------- ")
            guard let userID = Auth.auth().currentUser?.uid else { return }
            print(userID)
            usersCollectionRef.addDocument(data: data)
            print("user was added")
            dismiss()
        }else {
            print("some problems")
        }
    }
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewUserSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserSignUpView()
    }
}
