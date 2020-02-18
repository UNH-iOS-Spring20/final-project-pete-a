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
    var make : String
    var length : Double
    var price: Double
    
    init?(name: String,
          type: String,
          make: String,
          length: Double,
          price: Double) {
        
        if name.isEmpty {
            self.name = ""
        }
        if make.isEmpty {
            return nil
        }
        if length <= 0 {
            return nil
        }
        if price < 0 {
            return nil
        }
   
        self.name = name
        self.make = make
        self.length = length
        self.price = price
        
    }
}
