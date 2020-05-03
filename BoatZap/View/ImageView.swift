//
//  ImageView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/3/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
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
            storage.child("CCSailboat.jpg").downloadURL{ (url, err) in
                
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
