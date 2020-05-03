//
//  BoatPics.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 5/2/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import FirebaseFirestore

class BoatPics: FirebaseCodable {
    
    var id: String
    @Published var url: String
    
    var data: [String: Any] {
        return [
            "url": url,
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let url = data["url"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.url = url
    }
    
    #if DEBUG
    static let example = BoatPics(id: "1", data: ["url": "someplace-in-firestore"])!
    #endif
}

