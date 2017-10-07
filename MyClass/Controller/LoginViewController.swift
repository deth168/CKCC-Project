//
//  LoginViewController.swift
//  MyClass
//
//  Created by Radeth Chhay on 9/15/17.
//  Copyright © 2017 Radeth Chhay. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor(red: 0.00, green: 0.63, blue: 0.42, alpha: 1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLoginBottonPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (User, error) in
                if let FirebaseError = error {
                    print(FirebaseError.localizedDescription)
                    return
                }
            })
        } else {
            let alert = UIAlertController(title: "login failed!", message: "email or password is incorrect.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            alert.present(alert, animated: true, completion: nil)
        }
    }
    

}
