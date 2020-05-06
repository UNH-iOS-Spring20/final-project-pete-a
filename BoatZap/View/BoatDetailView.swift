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
    var boatPicCollectionRef: CollectionReference
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
                            HStack{
                                Image(systemName: "location")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("Navagate to boat")
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: EditBoatView(boat: boat).onAppear(){self.oldPriceCopy()}) {
                        HStack{
                            Image("paper-and-pen-tools")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("Edit Boat Information")
                        }
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
                        HStack{
                            Image(systemName: "icloud.and.arrow.up")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Upload Image")
                        }
                    }.sheet(isPresented:$shown) {
                        imagePicker(boat: self.boat, boatPicCollectionRef: self.boatPicCollectionRef,  shown: self.$shown)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: SetBoatLocationView(boat: boat)) {
                        HStack{
                            Image("big-anchor")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Update Boat Location")
                        }
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
                        .frame( height: 100)
                        //.fixedSize(horizontal: 30, vertical: 30 )
                        }
                    }
                }
            }.frame(width: 400, height: 800, alignment: .topLeading)
        }
    }
    func oldPriceCopy() { // Deep copy the old price to a separate structure so we can compare old price and new price.
        Variables.oldPrice = boat.price.copy() as! String
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
