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
        NavigationView {
            VStack {
                NavigationLink(destination: BuyerHomeView()) {
                    Text("Seller's Home")
                }
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                NavigationLink(destination: BuyerHomeView()) {
                    Text("List New Boat")
                }
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                NavigationLink(destination: BuyerHomeView()) {
                    Text("View Your Listings")
                }
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
        }
        .navigationBarTitle(Text("Sellers Home"))
    }
}

struct SellerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SellerHomeView()
    }
}
