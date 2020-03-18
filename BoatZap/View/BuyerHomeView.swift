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
        NavigationView {
            VStack {
                NavigationLink(destination: HomeView()) {
                    Text("Sailboat Listings")
                }
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                .padding(100)
                    .background(Color.blue)
                    .cornerRadius(15)

                NavigationLink(destination: HomeView()) {
                    Text("Power Boat Listings")
                }
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(15)

                NavigationLink(destination: HomeView()) {
                    Text("Other Listing")
                }
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(15)

                NavigationLink(destination: HomeView()) {
                    Text("Account Update")
                }
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(15)
            }
        }
            .navigationBarTitle(Text("Buyer's Home"))
    }
}



struct BuyerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerHomeView()
    }
}
