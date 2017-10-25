//
//  SignUpViewController.swift
//  MyClass
//
//  Created by Student on 10/4/17.
//  Copyright © 2017 Radeth Chhay. All rights reserved.
//

import UIKit
import QuartzCore
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextFIeld: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!

    
    var authService = AuthenicationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUpBotton(_ sender: UIButton) {
        
        let email = emailTextFIeld.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let password = passwordTextField.text
        let passwordConfirm = passwordConfirmTextField.text
        let alertController = AlertView()
        
        if password != passwordConfirm || (password?.count)! < 6 {
            alertController.alertView(title: "Sign up fail!", message: "Password does't match or must be more than 5 chars.", actionTitle: "Ok")
        }
        
        authService.signUp(email: email, firstName: firstName, lastName: lastName, password: password)
       }
}
