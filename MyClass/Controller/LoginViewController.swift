//
//  LoginViewController.swift
//  MyClass
//
//  Created by Radeth Chhay on 9/15/17.
//  Copyright © 2017 Radeth Chhay. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //FireDatabase
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FireDatabase
        ref = Database.database().reference()
        
       self.view.backgroundColor = UIColor(red: 0.00, green: 0.63, blue: 0.42, alpha: 1.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            presentHomeScreen()
            //let emailLabel = Auth.auth().currentUser?.email
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onLoginBottonPressed(_ sender: Any) {

        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "" || password == ""{
            
            let alert = UIAlertController(title: "Login failed!", message: "Please enter email and password.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        else{
            Auth.auth().signIn(withEmail: email!, password: password!, completion: { (user, error) in
                if error == nil {
                    
                    self.presentHomeScreen()
                    print("LOGGED IN")
                    
                }
                else {
                    
                    let alert = UIAlertController(title: "Login failed.", message: error?.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    print("ERROR")  
                }
            })
        }
            
    }
    
    func presentHomeScreen(){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        present(vc!, animated: true, completion: nil)
        
        
    }
}
    


