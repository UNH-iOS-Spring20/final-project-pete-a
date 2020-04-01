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
    @ObservedObject var boat: Boat
    
    init(boat: Boat) {
        self.boat = boat
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text(boat.name)
                Text(boat.type)
                Text(boat.make)
                Text(boat.length)
                Text(boat.price)
                Text(boat.address)
                Spacer()
            }
            NavigationLink(destination: EditBoatView(boat: boat)) {
                Text("Edit")
            }
        }
    }
}

struct BoatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoatDetailView(boat:
            Boat(id: "1", data: ["name": "Ocean 1",
                                                "type": "sailboat",
                                                "make": "C&C",
                                                "length": "54",
                                                "price": "450000",
                                                "address": "123 Sailboat Dr."])!
        )
    }
}
