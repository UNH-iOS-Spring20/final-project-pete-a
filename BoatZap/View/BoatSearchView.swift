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
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
        Group {
            VStack {
                Text("Boat List")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                NavigationLink(destination: AddBoatView()) {
                    Text("Add Boat")
                }
                List {
                    ForEach(boats.items) { boat in
                        NavigationLink(destination: BoatDetailView(boat: boat)) {
                            Text(boat.name)
                                
                            .foregroundColor(Color.black)
                            //.background(Color.blue)
                        }
                    }//.onDelete(perform: deleteBoat)
                }
                    //.foregroundColor(Color.blue)
                    .colorMultiply(.blue)
                 //   .listRowBackground(Color.red)
                
                //.background(Color.blue)
            }
           // .navigationBarTitle("BOAT SEARCH")
           // .navigationBarItems(leading: EditButton())
        }
    }
}
}

struct BoatSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BoatSearchView()
    }
}


