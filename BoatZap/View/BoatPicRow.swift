//
//  BoatPicRow.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/2/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct BoatPicRow: View {
    @ObservedObject var boatPic: BoatPics
    @State var url = ""
    
    var body: some View {
        VStack{
        if url != ""{
            AnimatedImage(url: URL(string: url)!).resizable().frame(height: 100).frame(width:100).cornerRadius(5)
        }
        else{
            IconLoader()
        }
    }
            
    .onAppear {
        let storage = Storage.storage().reference()
        storage.child(self.boatPic.url).downloadURL{ (url, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            self.url = "\(url!)"
        }
    }
}
}
struct BoatPicRow_Previews: PreviewProvider {
    static var previews: some View {
        BoatPicRow(boatPic: BoatPics.example)
    }
}

struct IconLoader : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<IconLoader>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<IconLoader>) {
    }
}
