//
//  AddBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/30/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct AddBoatView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = ""
    @State private var make = ""
    @State private var length = ""
    @State private var price = ""
    @State private var address = ""
    
    var body: some View {
        Group {
            VStack(spacing: 25) {
                HStack {
                    Text("Boat Name:")
                        //.padding(3)
                    TextField("Enter Name", text: $name)
                        .background(Color.white)
                        //.padding(3)
                }
                HStack {
                    Text("Boat Type:")
                    TextField("Boat Type", text: $type)
                        .background(Color.white)
                        .padding(3)
                }
                HStack {
                    Text("Boat Make")
                    TextField("Enter Boat Make", text: $make)
                        .background(Color.white)
                        .padding(3)
                }
                HStack {
                    Text("Boat length")
                    TextField("Enter Boat Length", text: $length)
                        .background(Color.white)
                        .padding(3)
                }
                HStack {
                    Text("Asking Price")
                    TextField("Enter Price", text: $price)
                        .background(Color.white)
                        .padding(3)
                }
                HStack {
                    Text("Boat Address")
                    TextField("Enter Address", text: $address)
                        .background(Color.white)
                        .padding(3)
                }
                Button(action: {
                    self.addBoat()
                }) {
                    Text("Add")
                }
                Spacer()
            }
            .navigationBarTitle("Add Boat")
        }
        .padding()
    }
    
    func addBoat() {
        if !name.isEmpty && !make.isEmpty && !type.isEmpty {
            let data = [
                    "name": name,
                    "type": type,
                    "make": make,
                    "length": length,
                    "price": price,
                    "address": address
                ]
            
            BoatsCollectionRef.addDocument(data: data)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddBoatView_Previews: PreviewProvider {
    static var previews: some View {
        AddBoatView()
    }
}
