//
//  BoatPicDetailView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/2/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct BoatPicDetailView: View {
    @ObservedObject var boatPic: BoatPics
    @ObservedObject var boat: Boat
    
    @State var url = ""
    
    var body: some View {
        
        VStack{
            if url != ""{
                AnimatedImage(url: URL(string: url)!).resizable()
                    //.aspectRatio(contentMode: .fill)//
                    .frame(height: 400).padding().cornerRadius(25).padding()
            }
            else{
                DetailLoader()
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

struct BoatPicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoatPicDetailView(boatPic: BoatPics.example, boat: Boat.example)
    }
}

struct DetailLoader : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<DetailLoader>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<DetailLoader>) {
    }
}
