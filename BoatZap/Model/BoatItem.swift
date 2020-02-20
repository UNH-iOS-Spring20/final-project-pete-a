//
//  BoatItem.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 2/17/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import UIKit

class BoatItem {
    var name: String
    let boatTypes = ["Power", "Sail"] //need to clean up boat types
    var type : String
    var make : String
    var length : Double
    var currentPrice: Double
    var startingPrice: Double? = 0.0
    
    init?(name: String,
        type: String,
        make: String,
        length: Double,
        currentPrice: Double
    ) {
        
        if name.isEmpty {
            self.name = ""
        }
        if make.isEmpty {
            return nil
        }
        if length <= 0 {
            return nil
        }
        if currentPrice < 0 {
            return nil
        }
   
        self.name = name
        self.type = type
        self.make = make
        self.length = length
        self.currentPrice = currentPrice
    }
    
    func returnPriceDifference(BoatItem: BoatItem) -> Double {
        var difference: Double = 0.0
        if BoatItem.startingPrice == nil {
                return 0.0
        }
        else {
            difference = BoatItem.currentPrice - BoatItem.startingPrice!
            return difference
        }
    }
    
}
