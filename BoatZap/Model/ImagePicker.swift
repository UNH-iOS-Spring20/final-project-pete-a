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
            
            let imageName = UUID().uuidString
            let storage = Storage.storage()
            let imageRef = storage.reference().child("boatPics/").child(imageName)
           // let storageRef = storage.reference()
           // let imagesRef = storageRef.child("boatPics")
            //var imageRef = imagesRef.child(imageName)
            
            
            imageRef.putData(image.jpegData(compressionQuality: 0.35)!, metadata: nil){ (_,err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
               // let storageRef = storage.reference()
               // TODO: put reference in firebase boat pic
                
                print("-----------storage reference----------")    //Remove after testing
               print(imageRef)         //Remove after testing
                
                
                print("success")
            }
            parent.shown.toggle()
        }
    }
}


//var imgData: NSData = NSData(data: UIImageJPEGRepresentation((self.img_Photo?.image)!, 0.8)!)
//self.uploadProfileImageToFirebase(data: imgData)
//
//
//func uploadProfileImageToFirebase(data:NSData){
//    let storageRef = Storage.storage().reference().child("usersPosts").child("\(uid).jpg")
//    if data != nil {
//        storageRef.putData(data as Data, metadata: nil, completion: { (metadata, error) in
//            if(error != nil){
//                print(error)
//                return
//            }
//            guard let userID = Auth.auth().currentUser?.uid else {
//                return
//            }
//            // Fetch the download URL
//            storageRef.downloadURL { url, error in
//                if let error = error {
//                    // Handle any errors
//                    if(error != nil){
//                        print(error)
//                        return
//                    }
//                } else {
//                    // Get the download URL for 'images/stars.jpg'
//
//                    let urlStr:String = (url?.absoluteString) ?? ""
//                    let values = ["downloadURL": urlStr]
//                    self.addImageURLToDatabase(uid: userID, values: values as [String : AnyObject])
//                }
//            }
//        })
//    }
//
//}
//
//
//func addImageURLToDatabase(uid:String, values:[String:AnyObject]){
//    let ref = Database.database().reference(fromURL: "https://exampleapp.firebaseio.com/")
//    let usersReference = ref.child("usersPosts").child((Auth.auth().currentUser?.uid)!)
//
//    usersReference.updateChildValues(values) { (error, ref) in
//        if(error != nil){
//            print(error)
//            return
//        }
//        self.parentVC?.dismiss(animated: true, completion: nil)
//    }
//
//}
