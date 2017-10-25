//
//  ActionView.swift
//  MyClass
//
//  Created by Mac on 10/19/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import Foundation
import UIKit

public class AlertView : UIViewController {
    
    public func alertView(title: String, message: String,actionTitle: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("alert success")
    }
}

