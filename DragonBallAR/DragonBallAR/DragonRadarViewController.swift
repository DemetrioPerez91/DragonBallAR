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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
   
    func addOverlay()
    {
        if let uLoc = currentUserLocation
        {
         
            
        }
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
    
    // implement delegate function for adding the overlay view to the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
      
            let renderer  = GridOverlayRenderer(overlay: overlay)
            return renderer
    }
   
    func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {
        let renderer = renderers[0] as! GridOverlayRenderer
        let origin = renderer.overlay.boundingMapRect.origin
        let size = renderer.overlay.boundingMapRect.size
        let coordinate = renderer.overlay.coordinate
        print("Renderer data:\n\t origin:\(origin)\n\t size\(size)\n\t coordinate \(coordinate)")
        print("RENDERER ADDED");
    }
}

extension DragonRadarViewController:CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else{return}
        currentUserLocation = userLocation.coordinate
        /*let timeSinceNow = userLocation.timestamp.timeIntervalSinceNow
        if(abs(timeSinceNow)<15)
        {
            
            var newRegion = radar.region
            newRegion.center = userLocation.coordinate
            newRegion.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            radar.setRegion(newRegion, animated: true)
            
            
            
            
            
        }*/
        //addOverlay()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse
        {
            manager.startUpdatingLocation()
        }
    }
}
