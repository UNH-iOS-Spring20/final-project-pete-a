//
//  CircleImage.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/3/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue, lineWidth: 6))
            .shadow(radius: 12)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("pizzeria4"))
    }
}

