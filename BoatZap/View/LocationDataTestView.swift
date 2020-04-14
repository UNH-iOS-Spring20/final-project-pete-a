//
//  LocationDataTestView.swift
//  BoatZap
//
//  Created on 4/13/20.
// code from stack overflow https://stackoverflow.com/questions/57681885/how-to-get-current-location-using-swiftui-without-viewcontrollers
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//


import SwiftUI

struct LocationDataTestView: View {

    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }

    var body: some View {
        VStack {
            Text("location status: \(locationManager.statusString)")
            HStack {
                Text("latitude: \(userLatitude)")
                Text("longitude: \(userLongitude)")
            }
        }
    }
}

struct LocationDataTestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDataTestView()
    }
}
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct LocationDataTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationDataTestView()
//    }
//}
