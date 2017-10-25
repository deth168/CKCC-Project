//
//  Constants.swift
//  MyClass
//
//  Created by Mac on 10/24/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
