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
import Firebase

struct ImagePicker: View {
    @State var shown = false
   // @State var imageRefLink = ""
    @ObservedObject var boat: Boat
    var boatPicCollectionRef: CollectionReference
    //var boatPic : BoatPics
   // @EnvironmentObject var  imageLinkENV: ImageLink
    
    var body: some View {
        
        Button(action: {
            self.shown.toggle()
        }) {
            Text("Upload Image")
        }.sheet(isPresented:$shown) {
            imagePicker(boat: self.boat, boatPicCollectionRef: self.boatPicCollectionRef, shown: self.$shown)
        }
    }
}
struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(boat: Boat.example, boatPicCollectionRef: boatsCollectionRef.document("3OuCCmIImdz31zre0taa").collection("pictures"))
    }
}

struct imagePicker : UIViewControllerRepresentable {
    @ObservedObject var boat: Boat
    //@ObservedObject var boatPic: BoatPics
    var boatPicCollectionRef: CollectionReference
    //@EnvironmentObject var  imageLinkENV: ImageLink
    
    func makeCoordinator() -> imagePicker.Coordinator {
        
        return imagePicker.Coordinator(parent1: self)
    }
    
    @Binding var shown : Bool
    //@Binding var imageRefLink : String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        
        let imagepic = UIImagePickerController()
        imagepic.sourceType = .photoLibrary
        imagepic.delegate = context.coordinator
        return imagepic
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @EnvironmentObject var  imageLinkENV: ImageLink
        var parent : imagePicker!
        
        init (parent1 : imagePicker ) {
            parent = parent1
            
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            parent.shown.toggle()
            
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            
            
            let imageName = UUID().uuidString
            let storage = Storage.storage()
            let imageLink1 = "boatPics/" + imageName //for firbasedatabase
            let imageRef = storage.reference().child("boatPics/").child(imageName)

            imageRef.putData(image.jpegData(compressionQuality: 0.35)!, metadata: nil){ (_,err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                
                print("-----------storage reference----------")    //Remove after testing
                print(imageRef)         //Remove after testing
                print(imageLink1)
                let data = ["url" : imageLink1]
                self.parent.boatPicCollectionRef.addDocument(data: data)//self.parent.imageRefLink = imageLink1
                //self.parent.boat.
                print("success")
            }
            parent.shown.toggle()
        }
    }
}
