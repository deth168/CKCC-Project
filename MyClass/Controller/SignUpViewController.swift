//
//  SignUpViewController.swift
//  MyClass
//
//  Created by Student on 10/4/17.
//  Copyright © 2017 Radeth Chhay. All rights reserved.
//

import UIKit
//import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextFIeld: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUpBotton(_ sender: UIButton) {
        
        if passwordTextField.text != passwordConfirmTextField.text || (passwordTextField.text?.count)! < 6{
            
            let alert = UIAlertController(title: "Error", message: "Passwords are not same!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Done", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        } else {
            
            if let email = emailTextFIeld.text, let password = passwordTextField.text {
                print("email and password signed up")
                Auth.auth().createUser(withEmail: email, password: password, completion:
                    { (user, error) in
                        
                        if error != nil {
                        let alert = UIAlertController(title: "Sign up failed!", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let action = UIAlertAction(title: "Done", style: .default, handler: nil)
                        
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                        }
     
                        let email = self.emailTextFIeld.text
                        let firstname = self.firstNameTextField.text
                        let lastname = self.lastNameTextField.text
                        
                        //create database
                        let ref = Database.database().reference()
                        let user : [String : AnyObject] = [
                            "email"     : email as AnyObject,
                            "firstname" : firstname as AnyObject,
                            "lastname"  : lastname as AnyObject,
                        ]
                        
                        let key = ref.childByAutoId().key
                        let addChild = ["users/\(key)" : user]
                        ref.updateChildValues(addChild)
                        print("1 user affected.")
                        
                        presentLoggedInScreen()
                })
            }
        }
        
        func presentLoggedInScreen() {
           let vc = storyboard?.instantiateViewController(withIdentifier: "Home")
            present(vc!, animated: true, completion: nil)
        }

    }
   

   

}
