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
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Retype Password :")
                    .font(.headline)
                SecureField("Password", text: $passwordVer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal, 5)
           // Section {
                Button(action: {
                    //addUser(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.password)
                    Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, error in
                   }
 
                }) {
                Text("Save")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(15)
                    .background(Color.blue)
                    .cornerRadius(15)
                }
                
           // }
            Button(action: {
                 createUser()
            }) {
                Text("Create Test Users")
                   .foregroundColor(Color.black)
                   .multilineTextAlignment(.center)
                   .padding(5)
                   .background(Color.blue)
                   .cornerRadius(15)
            }
        
            Button(action: {
                deleteCollection(collection: "users")
            }) {
                Text("Remove Test Users")
                   .foregroundColor(Color.black)
                   .multilineTextAlignment(.center)
                   .padding(5)
                   .background(Color.blue)
                   .cornerRadius(15)
            }
            
            Button(action: {
                getCollection(collection: "users")
            }) {
                Text("Get Test users")
                   .foregroundColor(Color.black)
                   .multilineTextAlignment(.center)
                   .padding(5)
                   .background(Color.blue)
                   .cornerRadius(15)
            }
            NavigationLink(destination: ContentView()) {
                Text("Home")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(5)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
        }
    }
}

func addUser(firstName: String, lastName :String, email :String, password :String ) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
    }
  //  ContentView()
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
// --- not sure how to do this with auto generated ref???
//private func updateUser() {
//    let userRef = db.collection("users")
//
//    userRef.document("Vetrano's").setData([
//        "name": "Vetrano's",
//        "city": "Charlestown",
//        "state": "RI"
//    ])
//
//    userRef.document("Midway Pizza").setData([
//        "name": "New Midway Pizza",
//        "city": "New London",
//        "state": "CT"
//    ])
//}

private func deleteCollection(collection: String) {
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
            return
        }

        for document in querySnapshot!.documents {
            print("Deleting \(document.documentID) => \(document.data())")
            document.reference.delete()
        }
    }
}

private func getCollection(collection: String) {
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}


struct USerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
