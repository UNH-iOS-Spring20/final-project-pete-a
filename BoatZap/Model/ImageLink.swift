//
//  ImageLink.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/3/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

class ImageLink: ObservableObject {
    @Published var link = ""
    
    func updateImageLink(updateLink: String){
        link=updateLink
    }
    
}
