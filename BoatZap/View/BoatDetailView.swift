//
//  DetailBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/31/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import MapKit
import FirebaseStorage
import SDWebImageSwiftUI

struct BoatDetailView: View {
    
    @ObservedObject var boat: Boat
    @ObservedObject var pics: FirebaseCollection<BoatPics>
    private var boatPicCollectionRef: CollectionReference
    @State var shown = false
    
    
    init(boat: Boat) {
        self.boat = boat
        self.boatPicCollectionRef = boatsCollectionRef.document(boat.id).collection("pictures")
        self.pics = FirebaseCollection<BoatPics>(collectionRef: boatPicCollectionRef)
    }
    
    var body: some View {
        
        
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Group{
                    Text("Boat Detail")
                        .font(.largeTitle)
                        .foregroundColor(Color.blue)
                    Text("Name: " + boat.name)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                        .padding(5)
                    Text("Type: " + boat.type)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                        .padding(5)
                    Text("Make: " + boat.make)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                        .padding(5)
                    Text("Length: " + boat.length)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                        .padding(5)
                    Text("Price: " + boat.price)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                        .padding(5)
                    Text("Address: " + boat.address)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                        .padding(5)
                }
                VStack(alignment: .leading, spacing: 5){
                    if boat.latitude != "" || boat.longitude != "" {
                        Button(action: {
                            self.navagateToBoat()
                        }) {
                            Text("Navagate to boat")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: EditBoatView(boat: boat)) {
                        Text("Edit Boat Information")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                    Button(action: {
                        self.shown.toggle()
                    }) {
                        Text("Upload Image")
                    }.sheet(isPresented:$shown) {
                        imagePicker(boat: self.boat, shown: self.$shown)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: SetBoatLocationView(boat: boat)) {
                        Text("Update Boat Location")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                    List {
                        ForEach(pics.items) { boatPic in
                            NavigationLink(destination: BoatPicDetailView(boatPic: boatPic, boat: self.boat)) {
                                BoatPicRow(boatPic: boatPic)
                            }
                        }
                    }
                }
            }.frame(width: 400, height: 800, alignment: .topLeading)
        }
    }
    func navagateToBoat() {
        
        let latDouble = (NumberFormatter().number(from: boat.latitude)?.doubleValue)!
        let longDouble = (NumberFormatter().number(from: boat.longitude)?.doubleValue)!
        
        let latitude:CLLocationDegrees = latDouble
        let longitude:CLLocationDegrees = longDouble
        
        let cooridnates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let placeMark = MKPlacemark(coordinate: cooridnates)
        let mapItem = MKMapItem(placemark: placeMark)
        
        mapItem.name = self.boat.name
        
        mapItem.openInMaps()
    }
}

struct BoatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoatDetailView(boat: Boat.example)
    }
}
