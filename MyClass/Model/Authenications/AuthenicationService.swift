//
//  AuthenicationService.swift
//  MyClass
//
//  Created by Mac on 10/18/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


struct AuthenicationService {
    
    //user sign up
    mutating func signUp(email: String!, firstName: String!, lastName: String!, password: String!) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                
                let user : [String : AnyObject] = [
                    "email"     : email as AnyObject,
                    "firstname" : firstName as AnyObject,
                    "lastname"  : lastName as AnyObject,
                    ]
                
                let ref = Database.database().reference()
                let key = ref.childByAutoId().key
                let addChild = ["users/\(key)" : user]
                ref.updateChildValues(addChild)
           
            } else {
                let alertCtr = AlertView()
                alertCtr.alertView(title: "Sign up fail!", message: (error?.localizedDescription)!, actionTitle: "Ok")
            }
        }
    }
    
    //user sign in
    func signIn(email: String, password: String) {
        
//        let alertController = AlertView()
//        if email == " " || password == " " {
//            alertController.alertView(title: "Sign in failed!", message: "email or password is empty.", actionTitle: "Ok")
//        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                
                let alertController = AlertView()
                alertController.alertView(title: "Sign in failed!", message: (error?.localizedDescription)!, actionTitle: "Ok")
            }
            else {
                let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDel.logUser()
            }
        }
    }
}
    
//    func createSearchBar(){
//        let searchBar = UISearchBar()
//        searchBar.showsCancelButton = false
//        searchBar.delegate = self
//
//        self.navigationItem.titleView = searchBar
//
//    }
    
        

    

