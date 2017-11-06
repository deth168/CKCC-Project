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
        
        
        //add current user marker
        let lastKnownLocation = getLastKnownLocation()
        if lastKnownLocation != nil {
            let marker = GMSMarker()
            marker.position = lastKnownLocation!.coordinate
            marker.title = "You're here!"
            marker.map = gMapsView
        } else {
            print("can't get user location!")
        }
        
        
        // request location update
        
        
    }
    
    func getLastKnownLocation() -> CLLocation?{
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        return locationManager.location
    }
    
}
