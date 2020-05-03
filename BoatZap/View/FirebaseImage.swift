////
////  FirebaseImageView.swift
////  BoatZap
////
////  Created by Peter Aurigemma on 5/2/20.
////  Copyright © 2020 Peter Aurigemma. All rights reserved.
//// Example from https://github.com/bmcmahen/julienne-swift/blob/master/julienne/FirebaseImage.swift
////
//
//import SwiftUI
//import Combine
//import FirebaseStorage
//
//final class Loader : ObservableObject {
//    let didChange = PassthroughSubject<Data?, Never>()
//    var data: Data? = nil {
//        didSet { didChange.send(data) }
//    }
//
//    init(_ id: String){
//        // the path to the image
//        let url = "\(id)"
//        let storage = Storage.storage()
//        let ref = storage.reference().child(url)
//        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
//            if let error = error {
//                print("--------error----------")
//                print("\(error)")
//                print("------------------------")
//            }
//
//            DispatchQueue.main.async {
//                self.data = data
//            }
//        }
//    }
//}
//
//
//
//let placeholder = UIImage(named: "placeholder.jpg")!
//
//struct FirebaseImage: View {
//    
//    init(id: String) {
//        self.imageLoader = Loader(id)
//    }
//
//    @ObservedObject private var imageLoader : Loader
//
//    var image: UIImage? {
//        imageLoader.data.flatMap(UIImage.init)
//    }
//
//    
//    var body: some View {
//        Image(uiImage: image ?? placeholder)
//        .resizable()
//        .aspectRatio(contentMode: .fill)
//    }
//}
//
//#if DEBUG
//struct FirebaseImage_Previews : PreviewProvider {
//    static var previews: some View {
//        FirebaseImage(id: "random")
//    }
//}
//#endif
//
