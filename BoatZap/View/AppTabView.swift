//
//  AppTabView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/4/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill").font(.title)
                    Text("HOME")
            }
            
            CreditView()
                .tabItem {
                    Image(systemName: "info.circle.fill").font(.title)
                    Text("Credits")
            }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .darkGray
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
