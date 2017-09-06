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

    var currentUserLocation:CLLocationCoordinate2D?
    
    @IBOutlet weak var radar: MKMapView!
    let manager = CLLocationManager()
    var tileRenderer:MKTileOverlayRenderer?
    
    
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
        setupTileRenderer()
        manager.delegate = self
        
        radar.delegate = self
        radar.showsUserLocation = true
        
        
    }
    
    
    func setupTileRenderer()
    {
        let overlay = RadarTile()
        radar.add(overlay)
        tileRenderer = MKTileOverlayRenderer(overlay: overlay)
        
    }
    
    func request()
    {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
      
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return tileRenderer!
    }
}

extension DragonRadarViewController:CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else{return}
        currentUserLocation = userLocation.coordinate
        let timeSinceNow = userLocation.timestamp.timeIntervalSinceNow
        if(abs(timeSinceNow)<15)
        {
            
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
