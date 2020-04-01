////
////  FirebaseSession.swift
////  BoatZap
////
////  Created by Peter Aurigemma on 3/14/20.
////  Copyright © 2020 Peter Aurigemma. All rights reserved.
////
//
//import FirebaseFirestore
//
//let firebaseSession = FirebaseSession() // singleton
//
//class FirebaseSession: ObservableObject {
//    
////----------------------- Boats ---------------------------------------
//    @Published var boats = [Boat]()
//    private let boatsCollection = Firestore.firestore().collection("boats")
//        
//    init() {
//        listenForChanges()
//    }
//    
//   // Reference link : https://firebase.google.com/docs/firestore/query-data/listen
//    func listenForChanges() {
//        boatsCollection.addSnapshotListener { querySnapshot, error in
//            guard let snapshot = querySnapshot else {
//                print("Error fetching snapshots: \(error!)")
//                return
//            }
//            snapshot.documentChanges.forEach { diff in
//                if (diff.type == .added) {
//                    print("Boat added: \(diff.document.data())")
////                    let boat = Boat(id: diff.document.documentID,
////                                        name: diff.document.get("name") as! String,
////                                        type: diff.document.get("type") as! String,
////                                        make: diff.document.get("make") as! String,
////                                        length: diff.document.get("length") as! String,
////                                        price: diff.document.get("price") as! String,
////                                        address: diff.document.get("address") as! String)
////                                        //location: diff.document.get("location") as! GeoPoint)
////
////                    self.boats.append(boat)
//                }
//                if (diff.type == .modified) {
//                    print("Boat modified: \(diff.document.data())")
//                    guard let modifiedIndex = self.boats.firstIndex(where: { $0.id == diff.document.documentID }) else {
//                        print("Could not find modified boat in data model")
//                        return
//                    }
//                    self.boats[modifiedIndex].name = diff.document.get("name") as! String
//                    self.boats[modifiedIndex].type = diff.document.get("type") as! String
//                    self.boats[modifiedIndex].make = diff.document.get("make") as! String
//                    self.boats[modifiedIndex].length = diff.document.get("length") as! String
//                    self.boats[modifiedIndex].price = diff.document.get("price") as! String
//                    self.boats[modifiedIndex].address = diff.document.get("address") as! String
//                   // self.boats[modifiedIndex].location = diff.document.get("location") as! GeoPoint
//                    
//                    
//                }
//                if (diff.type == .removed) {
//                    print("Boat removed: \(diff.document.data())")
//                    guard let removedIndex = self.boats.firstIndex(where: { $0.id == diff.document.documentID }) else {
//                        print("Could not find removed boat in data model")
//                        return
//                    }
//                    self.boats.remove(at: removedIndex)
//                }
//            }
//        }
//    }
//    
//    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
//    func createBoat(name: String, type: String, make: String, length: String, price: String, address: String/*, location: GeoPoint*/) {
//        boatsCollection.document().setData([
//          //  key = boat.key,
//            "name": name,
//            "type": type,
//            "make": make,
//            "length": length,
//            "price": price,
//            "address": address,
//            //"location": location
//        ])
//    }
//    
//    // Reference link: https://firebase.google.com/docs/firestore/manage-data/delete-data
//    func deleteBoat(index: Int) {
//        print("Deleting boat: \(boats[index])")
//        let id = self.boats[index].id
//        boatsCollection.document(id).delete() { err in
//            if let err = err {
//                print("Error removing document: \(err)")
//            } else {
//                print("Document successfully removed!")
//            }
//        }
//    }
//}
