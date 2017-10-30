//
//  ClassesViewController.swift
//  MyClass
//
//  Created by Mac on 10/22/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "classes") as! ClassTableViewCell
        
        let image = UIImage(named: "img_placehold")
        
        cell.classImageView.image = image
        cell.classNameLabel.text = "classname"
        cell.lastPostLabel.text = "ASD"
        cell.timeStampLabel.text = "3 hrs"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var cell = tableView.dequeueReusableCell(withIdentifier: "classes")
        
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.default,
                reuseIdentifier: "classes")
        }
    }
}
    





