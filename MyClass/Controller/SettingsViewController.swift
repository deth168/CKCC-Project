//
//  SettingsViewController.swift
//  MyClass
//
//  Created by Mac on 10/25/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignOutButtonPressed(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
            do {
                
                try Auth.auth().signOut()
                
                let vc = storyboard?.instantiateViewController(withIdentifier: "login")
                present(vc!, animated: true, completion: nil)
                print("LOGGED OUT")
                
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    }
    


