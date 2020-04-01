//
//  EditBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/31/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct EditBoatView: View {
    @ObservedObject var boat: Boat
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            VStack(spacing: 25) {
                HStack {
                    Text("Boat Name:")
                    TextField("Enter Name", text: $boat.name)
                }
                HStack {
                    Text("Boat Type:")
                    TextField("Enter type", text: $boat.type)
                }
                HStack {
                    Text("Boat Make:")
                    TextField("Enter Make", text: $boat.make)
                }
                HStack {
                    Text("Boat Length:")
                    TextField("Enter Length", text: $boat.length)
                }
                HStack {
                    Text("Boat Price:")
                    TextField("Enter Price", text: $boat.price)
                }
                HStack {
                    Text("Boat Address:")
                    TextField("Enter Address", text: $boat.address)
                }
                
                Button(action: {
                    self.updateBoat()
                }) {
                    Text("Save")
                }
                Spacer()
            }
            .navigationBarTitle("Edit \(boat.name)")
        }
        .padding()
    }
    func updateBoat() {
        if !boat.name.isEmpty && !boat.type.isEmpty && !boat.make.isEmpty && !boat.length.isEmpty && !boat.price.isEmpty && !boat.address.isEmpty { boatsCollectionRef.document(boat.id).setData(boat.data)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditBoatView_Previews: PreviewProvider {
    static var previews: some View {
        EditBoatView(boat: Boat(id: "1", data: ["name": "Ocean 1",
                                                "make": "C&C",
                                                "type": "Sailboat",
                                                "length": "34",
                                                "price": "45566",
                                                "address": "123 Sailboat Rd."
        ])!
        )
    }
}
