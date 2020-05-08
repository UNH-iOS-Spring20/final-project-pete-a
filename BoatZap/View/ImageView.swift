//
//  ImageView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/3/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//  reference for this is from https://www.youtube.com/watch?v=PYpTto3iQXU
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct ImageView: View {
    
    @State var url = ""
    var body: some View {
        
        VStack{
            if url != ""{
                AnimatedImage(url: URL(string: url)!).frame(height: 400).padding().cornerRadius(25).padding()
            }
            else{
                Loader()
            }
            
        }
        .onAppear {
            let storage = Storage.storage().reference()
            storage.child("boatPics/46ACE010-CF52-427C-B9B6-C44C71DD5974").downloadURL{ (url, err) in
                
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                self.url = "\(url!)"
            }
        }
    }
}
struct Loader : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
