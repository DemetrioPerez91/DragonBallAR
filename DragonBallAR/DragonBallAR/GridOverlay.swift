//
//  GridOverlay.swift
//  DragonBallAR
//
//  Created by User on 9/4/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit
import MapKit
class GridOverlay: NSObject, MKOverlay{
    // From MKAnnotation, for areas this should return the centroid of the area.
    var coordinate: CLLocationCoordinate2D
    // boundingMapRect should be the smallest rectangle that completely contains the overlay.
    // For overlays that span the 180th meridian, boundingMapRect should have either a negative MinX or a MaxX that is greater than MKMapSizeWorld.width.
    var boundingMapRect: MKMapRect
    
    init(coordinate:CLLocationCoordinate2D,boundingMapRect:MKMapRect)
    {
        self.coordinate = coordinate
        self.boundingMapRect = boundingMapRect
    }
    
    
    
}
