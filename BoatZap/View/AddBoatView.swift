//
//  AddBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/30/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import Firebase

struct AddBoatView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = ""
    @State private var make = ""
    @State private var length = ""
    @State private var price = ""
    @State private var address = ""
    @State private var latitude = ""
    @State private var longitude = ""
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
        Group {
            VStack(spacing: 25) {
                Text("Add Boat")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                
                HStack {
                    Text("Boat Name:")
                    .foregroundColor(Color.blue)
                        //.padding(3)
                    TextField("Enter Name", text: $name)
                    .padding(3)
                        .background(Color.blue)
                        //.padding(3)
                }
                HStack {
                    Text("Boat Type:")
                    .foregroundColor(Color.blue)
                    TextField("Boat Type", text: $type)
                        .padding(3)
                        .background(Color.blue)
                        .padding(3)
                }
                HStack {
                    Text("Boat Make")
                    .foregroundColor(Color.blue)
                    TextField("Enter Boat Make", text: $make)
                        .padding(3)
                        .background(Color.blue)
                        .padding(3)
                }
                HStack {
                    Text("Boat length")
                    .foregroundColor(Color.blue)
                    TextField("Enter Boat Length", text: $length)
                        .padding(3)
                        .background(Color.blue)
                        .padding(3)
                }
                HStack {
                    Text("Asking Price")
                    .foregroundColor(Color.blue)
                    TextField("Enter Price", text: $price)
                        .padding(3)
                        .background(Color.blue)
                        .padding(3)
                }
                HStack {
                    Text("Boat Address")
                    .foregroundColor(Color.blue)
                    TextField("Enter Address", text: $address)
                        .padding(3)
                        .background(Color.blue)
                        .padding(3)
                }
                Button(action: {
                    self.addBoat()
                }) {
                    Text("Add")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(15)
                
            }
        }
        .padding()
    }
    }
    
    func addBoat() {
        if !name.isEmpty && !make.isEmpty && !type.isEmpty && !length.isEmpty && !price.isEmpty && !address.isEmpty{
            let data = [
                    "name": name,
                    "type": type,
                    "make": make,
                    "length": length,
                    "price": price,
                    "address": address,
                    "latitude": latitude,
                    "longitude": longitude
                    
                ]
            
            boatsCollectionRef.addDocument(data: data)
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
