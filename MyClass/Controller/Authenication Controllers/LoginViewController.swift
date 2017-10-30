//
//  LoginViewController.swift
//  MyClass
//
//  Created by Radeth Chhay on 9/15/17.
//  Copyright © 2017 Radeth Chhay. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = UIColor(red: 0.00, green: 0.39, blue: 0.72, alpha: 1.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Auth.auth().currentUser != nil{
        self.presentHomeScreen()
        }
    }
        
    @IBAction func onLoginBottonPressed(_ sender: Any) {

        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "" || password == "" {
            let alert = UIAlertController(title: "Sign in failed!", message: "Please fill in email or password.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
            Auth.auth().signIn(withEmail: email!, password: password!, completion: { (user, error) in
                if error != nil {
                    
                    let alert = UIAlertController(title: "Sign in failed!", message: error?.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    
                    print("Signed in.")
                    self.presentHomeScreen()
                }
            })
    }
    
    public func presentHomeScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBar")
        present(vc!, animated: true, completion: nil)
    }
}
    


