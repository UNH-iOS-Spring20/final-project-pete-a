//
//  CreditView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/15/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            HStack {
                
                Image("boat")
                    .resizable()
                    .frame(width:30, height:30)
                Image("big-anchor")
                    .resizable()
                    .frame(width:30, height:30)
                Image("dollar-sign-symbol-bold-text")
                    .resizable()
                    .frame(width:30, height:30)
                Image("home-outline-variant")
                    .resizable()
                    .frame(width:30, height:30)
                Image("paper-and-pen-tools")
                    .resizable()
                    .frame(width:30, height:30)
                Image("sail-boat")
                    .resizable()
                    .frame(width:30, height:30)
                Image("settings")
                    .resizable()
                    .frame(width:30, height:30)
            }
            Text("Icons made by Freepik from www.flaticon.com")
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
