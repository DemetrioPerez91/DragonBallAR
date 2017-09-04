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
        radar.showsUserLocation = true
    }
    
    func request()
    {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
      
    }
    
}

extension DragonRadarViewController:CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else{return}
        let timeSinceNow = userLocation.timestamp.timeIntervalSinceNow
        if(abs(timeSinceNow)<15)
        {
            print("lat:\(userLocation.coordinate.latitude)\n Long: \(userLocation.coordinate.longitude)")
            
            var newRegion = radar.region
            newRegion.center = userLocation.coordinate
            newRegion.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            radar.setRegion(newRegion, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse
        {
            manager.startUpdatingLocation()
        }
    }
}
