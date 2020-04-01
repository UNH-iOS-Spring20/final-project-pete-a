////
////  DebugView.swift
////  BoatZap
////
////  Created by Peter Aurigemma on 3/15/20.
////  Copyright © 2020 Peter Aurigemma. All rights reserved.
////
//
//import SwiftUI
//import FirebaseFirestore
//import Firebase
//
//let db = Firestore.firestore()
//
//struct DebugView: View {
//    var body: some View {
//        VStack{
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Button(action: {
//                createUser()
//            }) {
//                Text("Create Test Users")
//            }
//               .foregroundColor(Color.black)
//               .multilineTextAlignment(.center)
//               .padding(5)
//               .background(Color.blue)
//               .cornerRadius(15)
//            
//            Button(action: {
//                deleteCollection(collection: "users")
//            }) {
//                Text("Remove Test Users")
//            }
//                   .foregroundColor(Color.black)
//                   .multilineTextAlignment(.center)
//                   .padding(5)
//                   .background(Color.blue)
//                   .cornerRadius(15)
//            
//            Button(action: {
//                getCollection(collection: "users")
//            }) {
//                Text("Get Test users")
//            }
//                   .foregroundColor(Color.black)
//                   .multilineTextAlignment(.center)
//                   .padding(5)
//                   .background(Color.blue)
//                   .cornerRadius(15)
//            
//            NavigationLink(destination: HomeView()) {
//                Text("Home")
//            }
//                    .foregroundColor(Color.black)
//                    .multilineTextAlignment(.center)
//                    .padding(5)
//                    .background(Color.blue)
//                    .cornerRadius(15)
//        }
//    }
//}
//
//private func createUser() {
//    let UserRef = db.collection("users")
//    
//    UserRef.document().setData([
//        "firstName": "Peter",
//        "LastName": "Aurigemma",
//        "email": "pauri1@gmail.com",
//        "confirmEmail": "pauri1@gmail.com",
//        "buyer" : true,
//        "seller" : true
//    ])
//    
//    UserRef.document().setData([
//        "firstName": "Jill",
//        "LastName": "Moler",
//        "email": "jmoler@gmail.com",
//        "confirmEmail": "jmoler@gmail.com",
//        "buyer" : true,
//        "seller" : false
//    ])
//
//    UserRef.document().setData([
//        "firstName": "Mike",
//        "LastName": "Hall",
//        "email": "mhall23@gmail.com",
//        "confirmEmail": "mhall23@gmail.com",
//        "buyer" : false,
//        "seller" : true
//    ])
//}
//
//private func deleteCollection(collection: String) {
//    db.collection(collection).getDocuments() { (querySnapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//            return
//        }
//
//        for document in querySnapshot!.documents {
//            print("Deleting \(document.documentID) => \(document.data())")
//            document.reference.delete()
//        }
//    }
//}
//
//private func getCollection(collection: String) {
//    db.collection(collection).getDocuments() { (querySnapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//        } else {
//            for document in querySnapshot!.documents {
//                print("\(document.documentID) => \(document.data())")
//            }
//        }
//    }
//}
//
//struct DebugView_Previews: PreviewProvider {
//    static var previews: some View {
//        DebugView()
//    }
//}
