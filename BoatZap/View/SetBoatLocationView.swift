//
//  SwiftUIView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/26/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import MapKit
import Firebase

struct SetBoatLocationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var boat: Boat
    
    var userLatitude: String {
        return "\(self.locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var userLongitude: String {
        return "\(self.locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Location of \(boat.name)")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                
                MapView()
                
                HStack {
                    Text("latitude: \(userLatitude)")
                    Text("longitude: \(userLongitude)")
                }
                .foregroundColor(Color.blue)
                .padding(3)
                
                Button(action: {
                    
                    boatsCollectionRef.document(self.boat.id).updateData([
                        "longitude" : self.userLongitude,
                        "latitude" : self.userLatitude
                    ])
                    
                    print("LAT AND LONG ENTERED")
                    print("Latitude is : " )
                    print(self.userLatitude)
                    print("Longitude is : " )
                    print(self.userLongitude)
                    self.dismiss()
                    
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
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SetBoatLocationView(boat: Boat.example)
    }
}
