//
//  MapView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 4/8/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation
//
//struct MapView: UIViewRepresentable {
//    weak var mapView: MKMapView!
//    fileprivate let locationManager:CLLocationManager = CLLocationManager()
//
//    func makeUIView(context: Context) -> MKMapView {
//        MKMapView(frame: .zero)
//    }
//    func updateUIView(_ view: MKMapView, context: Context) {
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = kCLDistanceFilterNone
//        locationManager.startUpdatingLocation()
//
//        mapView.showsUserLocation = true
////        let coordinate = CLLocationCoordinate2D(
////            latitude: 34.011286, longitude: -116.166868)
////        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
////        let region = MKCoordinateRegion(center: coordinate, span: span)
////        view.setRegion(region, animated: true)
//    }
//}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}

struct MapView: UIViewRepresentable {
  
  var locationManager = CLLocationManager()
   // var boatLocaton =  CLLocationCoordinate2DMake();
    // TODO GRAB BOAT LOCATION
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
  }
}
