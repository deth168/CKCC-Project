//
//  GMapsViewController.swift
//  MyClass
//
//  Created by Student on 10/30/17.
//  Copyright © 2017 Radeth Chhay. All rights reserved.
//

import UIKit
import GoogleMaps

class GMapsViewController: UIViewController {

    @IBOutlet weak var gMapsView: GMSMapView!
    let ckccLat = 11.569034
    let ckccLng = 104.888493
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ckccCameraPosition = GMSCameraPosition.camera(withLatitude: ckccLat, longitude: ckccLng, zoom: 15)
        gMapsView.animate(to: ckccCameraPosition)
        
        
    }
    
}
