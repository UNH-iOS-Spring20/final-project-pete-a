//
//  CustomSearchBar.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 4/21/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//


import SwiftUI
import Firebase

struct CustomSearch: View {
    
    @ObservedObject var data = getData()
    
    var body: some View {
       
        NavigationView{
            
            ZStack(alignment: .top){
                
                GeometryReader{_ in
                    
                    // Home View....
                    Text("Home")
                    
                }.background(Color("Color").edgesIgnoringSafeArea(.all))
                
                CustomSearchBar(data: self.$data.datas).padding(.top)
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct CustomSearch_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearch()
    }
}

struct CustomSearchBar : View {
    
    @State var txt = ""
    @Binding var data : [dataType]
    
    var body : some View{
        
        VStack(spacing: 0){
            
            HStack{
                
                TextField("Search", text: self.$txt)
                
                if self.txt != ""{
                    
                    Button(action: {
                        
                        self.txt = ""
                        
                    }) {
                        
                        Text("Cancel")
                    }
                    .foregroundColor(.black)
                    
                }

            }.padding()
            
            if self.txt != ""{
                
                if  self.data.filter({$0.name.lowercased().contains(self.txt.lowercased())}).count == 0{
                    
                    Text("No Results Found").foregroundColor(Color.black.opacity(0.5)).padding()
                }
                else{
                    
                List(self.data.filter{$0.name.lowercased().contains(self.txt.lowercased())}){i in
                            
                    NavigationLink(destination: Detail(data: i)) {
                        
                        Text(i.name)
                    }
                            
                        
                    }.frame(height: UIScreen.main.bounds.height / 5)
                }

            }
            
            
        }.background(Color.white)
        .padding()
    }
}

class getData : ObservableObject{
    
    @Published var datas = [dataType]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("boats").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let id = i.documentID
                let name = i.get("name") as! String
                let type = i.get("type") as! String
                
                self.datas.append(dataType(id: id, name: name, type: type))
            }
        }
    }
}

struct dataType : Identifiable {
    
    var id : String
    var name : String
    var type : String
}

struct Detail : View {
    
    var data : dataType
    
    var body : some View{
        
        Text(data.type)
    }
}




//----------- first try--------------
//import SwiftUI
//
//struct CustomSearchBar: View {
//
//    @State var txt = ""
//   // @Binding var boat : [dataType]
//
//    var body: some View {
//
//        ZStack(alignment: .top){
//
//            GeometryReader {_ in
//
//                Text("Home")
//            }.background(Color("Color").edgesIgnoringSafeArea(.all))
//
//
//
//            //----------------
//            VStack {
//                HStack {
//                    TextField("Search", text: self.$txt)
//
//                    if self.txt != "" {
//                        Button(action: {
//                            self.txt = ""
//
//                        }) {
//                            Text("Cancel")
//                        }
//                        .foregroundColor(.black)
//                    }
//                }.padding()
//            }.background(Color.white)
//            .padding()
//            //------------------
//        }
//    }
//}
//
//struct CustomSearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSearchBar()
//    }
//}
