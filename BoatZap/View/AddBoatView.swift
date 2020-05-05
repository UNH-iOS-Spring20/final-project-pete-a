//
//  AddBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/30/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import Firebase
import UIKit

struct AddBoatView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingPriceAlert = false
    
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
                    CircleImage(image: Image("placeholder"))
                    Text("Add Boat")
                        .font(.largeTitle)
                        .foregroundColor(Color.blue)
                    
                    HStack {
                        Text("Boat Name:")
                            .foregroundColor(Color.blue)
                        TextField("Enter Name", text: $name)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Type:")
                            .foregroundColor(Color.blue)
                        TextField("Boat Type", text: $type)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Make")
                            .foregroundColor(Color.blue)
                        TextField("Enter Boat Make", text: $make)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat length")
                            .foregroundColor(Color.blue)
                        TextField("Enter Boat Length", text: $length)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Asking Price")
                            .foregroundColor(Color.blue)
                        TextField("Enter Price", text: $price)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Address")
                            .foregroundColor(Color.blue)
                        TextField("Enter Address", text: $address)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
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
                .alert(isPresented: $showingPriceAlert) {
                    Alert(title: Text("Error"), message: Text("Price can only contain numbers and one decimal"), dismissButton: .default(Text("OK")) {
                        })
                }
            }
            .padding()
        }
    }
    
    func addBoat() {
    
        if Double(price) == nil {
            print("price is NOT a double")
            self.showingPriceAlert.toggle()
        } else {
            print("priceis a double")
            if !name.isEmpty && !make.isEmpty && !type.isEmpty && !length.isEmpty && !price.isEmpty && !address.isEmpty{
                let photo = String(Int.random(in:1 ..< 6))
                let data = [
                    "name": name,
                    "type": type,
                    "make": make,
                    "length": length,
                    "price": price,
                    "address": address,
                    "latitude": latitude,
                    "longitude": longitude,
                    "photo": photo,
                ]
                boatsCollectionRef.addDocument(data: data)
                dismiss()
            }
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
