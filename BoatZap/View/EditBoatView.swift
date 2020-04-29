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
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
        
        Group {
            VStack(spacing: 25) {
                Text("Edit \(boat.name)")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                HStack {
                    Text("Boat Name:")
                    .foregroundColor(Color.blue)
                    TextField("Enter Name", text: $boat.name)
                    .padding(3)
                    .background(Color.blue)
                }
                HStack {
                    Text("Boat Type:")
                    .foregroundColor(Color.blue)
                    TextField("Enter type", text: $boat.type)
                    .padding(3)
                    .background(Color.blue)
                }
                HStack {
                    Text("Boat Make:")
                    .foregroundColor(Color.blue)
                    TextField("Enter Make", text: $boat.make)
                    .padding(3)
                    .background(Color.blue)
                }
                HStack {
                    Text("Boat Length:")
                    .foregroundColor(Color.blue)
                    TextField("Enter Length", text: $boat.length)
                    .padding(3)
                    .background(Color.blue)
                }
                HStack {
                    Text("Boat Price:")
                    .foregroundColor(Color.blue)
                    TextField("Enter Price", text: $boat.price)
                    .padding(3)
                    .background(Color.blue)
                }
                HStack {
                    Text("Boat Address:")
                    .foregroundColor(Color.blue)
                    TextField("Enter Address", text: $boat.address)
                    .padding(3)
                    .background(Color.blue)
                }
                
                Button(action: {
                    self.updateBoat()
                }) {
                    Text("Save")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(15)
                Spacer()
            }
            //.navigationBarTitle("Edit \(boat.name)")
        }
        .padding()
    }
}
    func updateBoat() {
        if !boat.name.isEmpty && !boat.type.isEmpty && !boat.make.isEmpty && !boat.length.isEmpty && !boat.price.isEmpty && !boat.address.isEmpty {
            boatsCollectionRef.document(boat.id).setData(boat.data)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditBoatView_Previews: PreviewProvider {
    static var previews: some View {
        EditBoatView(boat: Boat.example)
    }
}
