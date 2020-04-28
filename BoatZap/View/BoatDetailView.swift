//
//  DetailBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/31/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct BoatDetailView: View {
   // @ObservedObject private var boats = FirebaseCollection<Boat>(collectionRef: boatsCollectionRef)
    @ObservedObject var boat: Boat
    
    init(boat: Boat) {
        self.boat = boat
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Boat Detail")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
            //Spacer()
            Text("Name: " + boat.name)
                .font(.headline)
                .padding(5)
            Text("Type: " + boat.type)
                .font(.headline)
                .padding(5)
            Text("Make: " + boat.make)
                .font(.headline)
                .padding(5)
            Text("Length: " + boat.length)
                .font(.headline)
                .padding(5)
            Text("Price: " + boat.price)
                .font(.headline)
                .padding(5)
            Text("Address: " + boat.address)
                .font(.headline)
                .padding(5)
            Text("Lat and long: " + boat.latitude + ", " + boat.longitude )
                .font(.headline)
                .padding(5)
//            Text("Longitude: " + boat.longitude)
//                .font(.headline)
//                .padding(5)
            NavigationLink(destination: EditBoatView(boat: boat)) {
                Text("Edit")
            }
            NavigationLink(destination: SetBoatLocationView(boat: boat)) {
                Text("Update Boat Location")
//            }
            }
           // Spacer()
            
        }.frame(width: 400, height: 400, alignment: .topLeading)
    }
}

struct BoatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoatDetailView(boat: Boat.example)
    }
}
