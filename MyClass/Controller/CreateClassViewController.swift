//
//  CreateClassViewController.swift
//  MyClass
//
//  Created by Mac on 10/15/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateClassViewController: UIViewController {

    @IBOutlet weak var classNameTextField: UITextField!
    @IBOutlet weak var classCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNextButtonPressed(_ sender: Any) {
        
        let className = classNameTextField.text
        let classCode = classCodeTextField.text
        
        let ref = Database.database().reference()
        
        let classGroup : [String : AnyObject] = [
            "classname" : className as AnyObject,
            "classcode" : classCode as AnyObject
        ]
        
        let key = ref.childByAutoId().key
        let addClass = ["classes/\(key)" : classGroup]
        ref.updateChildValues(addClass)
        print("added new class")
        
        }
    }
    
    
    


