//
//  User.swift
//  MyClass
//
//  Created by Mac on 10/18/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct User {
    
    var ref: DatabaseReference?
    var key: String!
    var email: String!
    var firstName: String!
    var lastName: String!
    
    init(snapshot: DataSnapshot) {
        
        ref = snapshot.ref
        key = snapshot.key
        email = snapshot.value(forKey: "email") as! String
        firstName = snapshot.value(forKey: "firstName") as! String
        lastName = snapshot.value(forKey: "lastName") as! String
    }
}
