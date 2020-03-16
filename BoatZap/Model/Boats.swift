//
//  Boats.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/15/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import FirebaseFirestore

struct Boats: Identifiable {
    var id: String
    var name: String
    var type: String
    var make: String
    var length: Double
    var price: Double
    var address: String
    var location: GeoPoint
}
