//
//  SellerHomeView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/4/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct SellerHomeView: View {
    var body: some View {
        Form {
           // VStack {
                Section {
                    Text("Seller's Home")
                        .font(.largeTitle)
                        .foregroundColor(Color.blue)
                }
                Section {
                    NavigationLink(destination: ContentView()) {
                        Text("List New Boat")
                    }
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                }
                Section {
                    NavigationLink(destination: ContentView()) {
                        Text("View Your Listings")
                    }
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                }
                Section {
                    NavigationLink(destination: ContentView()) {
                        Text("Account Update")
                    }
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
               // }
            }
        }
    }
}

struct SellerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SellerHomeView()
    }
}
