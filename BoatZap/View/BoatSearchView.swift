//
//  BoatSearchView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/31/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct BoatSearchView: View {
    @ObservedObject private var boats = FirebaseCollection<Boat>(collectionRef: boatsCollectionRef)
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddBoatView()) {
                    Text("Add Boat")
                }
                List {
                    ForEach(boats.items) { boat in
                        NavigationLink(destination: BoatDetailView(boat: boat)) {
                            Text(boat.name)
                        }
                    }//.onDelete(perform: deleteBoat)
                }
            }
            .navigationBarTitle("BOAT SEARCH")
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct BoatSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BoatSearchView()
    }
}
