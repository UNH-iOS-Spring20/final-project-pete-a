//
//  SwiftUIView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/26/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import MapKit

struct SetBoatLocationView: View {
    var body: some View {
        VStack {
            MapView()
            Button(action: {
                //TODO: Save Location to firestore
            }) {
                Text("Save Location")
            }
            .foregroundColor(Color.black)
            .multilineTextAlignment(.center)
            .padding(20)
            .background(Color.blue)
            .cornerRadius(15)
            Spacer()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SetBoatLocationView()
    }
}
