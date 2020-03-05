//
//  BuyerHomeView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/4/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct BuyerHomeView: View {

   var body: some View {
            Form {
                VStack {
                    Section {
                        Text("Buyer's Home")
                            .font(.largeTitle)
                            .foregroundColor(Color.blue)
                    }
                    Section {
                        NavigationLink(destination: ContentView()) {
                            Text("Sailboat Listings")
                        }
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(15)
                    }
                    Section {
                        NavigationLink(destination: ContentView()) {
                            Text("Power Boat Listings")
                        }
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(15)
                    }
                    Section {
                        NavigationLink(destination: ContentView()) {
                            Text("Other Listing")
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
                    }
                }
            }
        }
    }


struct BuyerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerHomeView()
    }
}
