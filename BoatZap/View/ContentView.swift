//
//  ContentView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 2/17/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import Firebase

let boatsCollectionRef = Firestore.firestore().collection("boats")
let usersCollectionRef = Firestore.firestore().collection("users")

struct ContentView: View {
    
    //@EnvironmentObject var  imageLinkENV: ImageLink
   // @State var photoLink = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack {
                        HStack{
                            NavigationLink(destination: SignInView()) {
                                Text("Sign in")
                            }
                            .foregroundColor(Color.blue)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .multilineTextAlignment(.leading)
                            Spacer()
                            NavigationLink(destination: NewUserSignUpView()) {
                                Text("Sign up")
                            }
                            .foregroundColor(Color.blue)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .multilineTextAlignment(.trailing)
                        }
                      
                        Spacer()
                        
                        
                        Text("BoatZap Navigator")
                            .font(.largeTitle)
                            .foregroundColor(Color.blue)
                        Spacer()
                        CircleImage(image: Image("FrontPageBoat"))
                        Divider()
                        Spacer()
                    }
                    
                    NavigationLink(destination: AddBoatView()) {
                        HStack{
                            Image(systemName: "plus.rectangle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Add Boat")
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                    
                    NavigationLink(destination: BoatSearchView()) {
                        HStack{
                            Image("boat")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Boat Search")
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: CreditView()) {
                        HStack{
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Credits")
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    Spacer()
                }
            .padding()
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
