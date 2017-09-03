//
//  DragonRadarViewController.swift
//  DragonBallAR
//
//  Created by User on 9/3/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DragonRadarViewController: UIViewController {

    
    @IBOutlet weak var radar: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
   
    
    
    
}


extension DragonRadarViewController:MKMapViewDelegate
{
    func setup()
    {
       request()
        manager.delegate = self
        radar.delegate = self
    }
    
    func request()
    {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    
}

extension DragonRadarViewController:CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
