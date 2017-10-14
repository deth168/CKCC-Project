//
//  SignUpViewController.swift
//  MyClass
//
//  Created by Student on 10/4/17.
//  Copyright © 2017 Radeth Chhay. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextFIeld: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
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
                Auth.auth().createUser(withEmail: email, password: password, completion: { (User, error) in
                    if let FirebaseError = error {
                        print(FirebaseError.localizedDescription)
                        return
                    }
                    presentLoggedInScreen()
                })
            }
        }
        
        func presentLoggedInScreen() {
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let NoClassViewController:NoClassViewController = storyboard.instantiateViewController(withIdentifier: "NoClassViewController") as! NoClassViewController
            self.present(NoClassViewController, animated: true, completion: nil)
        }

    }
   

   

}
