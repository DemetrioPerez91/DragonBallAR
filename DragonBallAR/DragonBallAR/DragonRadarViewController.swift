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
    
    
    
    func addAnnotation()
    {
        let coordinate = CLLocationCoordinate2D(latitude: 33.931416,  longitude: -84.464599)
        let db = DragonBallAnnotation(coordinate, title: "lol", subtitle: "lol")
        radar.addAnnotation(db)
    }
}


extension DragonRadarViewController:MKMapViewDelegate
{
    func setup()
    {
        request()
        //setupTileRenderer()
        manager.delegate = self
        
        radar.delegate = self
        radar.showsUserLocation = true
        addAnnotation()
        
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? DragonBallAnnotation {
            let identifier = "pin"
            var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if view == nil
            {
                view = MKAnnotationView(annotation: annotation , reuseIdentifier: identifier)
            }
                // 3
            view?.annotation = annotation
            view?.isEnabled = true
            
            view?.canShowCallout = true
            view?.image = #imageLiteral(resourceName: "dragonballSrpite.png")
          
            
            
            return view
        }
        return nil
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
