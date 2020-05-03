//
//  BoatPicDetailView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/2/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct BoatPicDetailView: View {
    @ObservedObject var boatPic: BoatPics
    @ObservedObject var boat: Boat
    
    var body: some View {
        Text(boatPic.url)
        .font(.largeTitle)
        .padding()
    }
}

struct BoatPicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoatPicDetailView(boatPic: BoatPics.example, boat: Boat.example)
    }
}
