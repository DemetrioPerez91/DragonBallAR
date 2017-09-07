//
//  DragonBallAnnotation.swift
//  DragonBallAR
//
//  Created by User on 9/6/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit
import MapKit
class DragonBallAnnotation: NSObject,MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(_ coordinate: CLLocationCoordinate2D, title: String, subtitle: String)
    {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
    }
    
    
    
}
