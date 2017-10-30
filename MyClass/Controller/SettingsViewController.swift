//
//  SettingsViewController.swift
//  MyClass
//
//  Created by Mac on 10/25/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_settings") as! SettingsTableViewCell
        let image = UIImage(named: "ic_user_default")
        
        cell.profileImage.image = image
        cell.profileLabel.text = "Profile"
        cell.firstnameLastname.text = Auth.auth().currentUser?.uid
        
        
        return cell
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
    


