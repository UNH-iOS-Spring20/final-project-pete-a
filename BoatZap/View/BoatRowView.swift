//
//  BoatRowView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/3/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct BoatRowView: View {
    @ObservedObject var boat: Boat
    
    var body: some View {
        HStack {
            Image("boat\(boat.photo)")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 3))
            Text(boat.name)
            Spacer()
            Text("Price $ \(boat.price)")
        }
    }
}

struct BoatRowView_Previews: PreviewProvider {
    static var previews: some View {
        BoatRowView(boat: Boat.example)
    }
}
