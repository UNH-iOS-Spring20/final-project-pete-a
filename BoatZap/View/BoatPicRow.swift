//
//  BoatPicRow.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/2/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct BoatPicRow: View {
    @ObservedObject var boatPic: BoatPics
    
    var body: some View {
        Text(boatPic.url)
    }
}

struct BoatPicRow_Previews: PreviewProvider {
    static var previews: some View {
        BoatPicRow(boatPic: BoatPics.example)
    }
}
