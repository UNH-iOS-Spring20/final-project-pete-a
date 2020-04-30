//
//  ImagePicker.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 4/29/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//  youtube video https://www.youtube.com/watch?v=zfJtgq609EE
//  Kavsoft Firebase Cloud Storage in SwiftUI - How to Store Images in Firebase Cloud Storage In SwiftUI
//

import SwiftUI
import FirebaseStorage

struct ImagePicker: View {
    @State var shown = false
    
    var body: some View {
        
        Button(action: {
            self.shown.toggle()
        }) {
            Text("Upload Image")
        }.sheet(isPresented:$shown) {
            imagePicker(shown: self.$shown)
        }
    }
}
struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}

struct imagePicker : UIViewControllerRepresentable {
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePicker.Coordinator(parent1: self)
    }
    
    @Binding var shown : Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        
        let imagepic = UIImagePickerController()
        imagepic.sourceType = .photoLibrary
        imagepic.delegate = context.coordinator
        return imagepic
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent : imagePicker!
        init (parent1 : imagePicker) {
            
            parent = parent1
            
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            parent.shown.toggle()
            
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            
            let storage = Storage.storage()
            storage.reference().child("temp").putData(image.jpegData(compressionQuality: 0.35)!, metadata: nil){ (_,err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                print("success")
            }
            parent.shown.toggle()
        }
    }
}
