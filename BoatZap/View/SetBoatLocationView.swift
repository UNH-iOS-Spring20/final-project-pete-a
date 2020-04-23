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
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var locationManager = LocationManager()
    
    @State private var latitude = ""
    @State private var longitude = ""
   
    // TODO Chance self to a boat.
    
    var body: some View {
        VStack {
            MapView()
            Button(action: {
                
                var userLatitude: String {
                    return "\(self.locationManager.lastLocation?.coordinate.latitude ?? 0)"
                }
                var userLongitude: String {
                    return "\(self.locationManager.lastLocation?.coordinate.longitude ?? 0)"
                }
                
                self.latitude = userLatitude
                self.longitude = userLongitude
                
                print("LAT AND LONG ENTERED")
                print("Latitude is : " )
                print(self.latitude)
                print("Longitude is : " )
                print(self.longitude)
                
                
            }) {
                Text("Save Boat Location")
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
