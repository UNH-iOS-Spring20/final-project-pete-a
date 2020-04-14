//
//  ContentView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 2/17/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import Firebase

let boatsCollectionRef = Firestore.firestore().collection("boats")

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("BoatZap Navagator")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                NavigationLink(destination: UserInfoView()) {
                    Text("New Users View")
                }
                NavigationLink(destination: SellerHomeView()) {
                    Text("Seller Home View")
                }
                NavigationLink(destination: BuyerHomeView()) {
                    Text("Buyer Home View")
                }
                NavigationLink(destination: AddBoatView()) {
                    Text("Add Boat")
                }
                NavigationLink(destination: MapView()) {
                    Text("Boat Location View")
                }
                NavigationLink(destination: LocationDataTestView()) {
                    Text("Boat Location Test View")
                }
                NavigationLink(destination: CreditView()) {
                    Text("Credits")
                }
                NavigationLink(destination: BoatSearchView()) {
                    Text("Boat Search")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
