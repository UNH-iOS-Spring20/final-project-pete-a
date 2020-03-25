//
//  ListBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/22/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import Firebase

struct ListBoatView: View {
    
    @ObservedObject private var fbSession = firebaseSession
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = ""
    @State private var make = ""
    @State private var length = ""
    @State private var price = ""
    @State private var address = ""
    
    var body: some View {
        
            VStack(alignment: .leading) {
                Text("Create Boat Listing")
                    .font(.largeTitle)
            Group {
                   // .foregroundColor(Color.blue)
               // Group {
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
    //                HStack {
    //                    Text("Boat Location PLACE HOLDER")
    //                   // TextField("Enter Location", text: $address)
    //                   // .padding()
    //                }
                    Button(action: {
                        self.addBoat()
                    }) {
                        Text("Add")
                            .padding(3)
                            .font(.title)
                            .foregroundColor(Color.black)
                            .background(Color.blue)
                            .cornerRadius(15)
                        
                    }
               // }
                
            }
            //.background(Color.blue)
            //.cornerRadius(15)
            //.padding(10)
        }
            .foregroundColor(Color.black)
            .multilineTextAlignment(.center)
            .padding(15)
           // .background(Color.blue)
            //.cornerRadius(15)
            .padding(3)
    }
    func addBoat() {
        if !name.isEmpty && !length.isEmpty && !price.isEmpty && !address.isEmpty {
            
            fbSession.createBoat(name: name, type: type, make: make, length: length, price: price, address: address/*location: location*/)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct ListBoatView_Previews: PreviewProvider {
    static var previews: some View {
        ListBoatView()
    }
}

