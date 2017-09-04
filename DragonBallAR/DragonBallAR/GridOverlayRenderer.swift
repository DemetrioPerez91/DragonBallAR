//
//  GridOverlayRenderer.swift
//  DragonBallAR
//
//  Created by User on 9/4/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit
import MapKit

// An overlay must conform to the protocol MKOverlayRenderer which already inherits from NSObject
class GridOverlayRenderer: MKOverlayRenderer
{
    
  
    let overlayImage = #imageLiteral(resourceName: "green grid")
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        
        //Extract CGImage property from the greenGrid
        if let cgImage = overlayImage.cgImage{
            //Extract rectangle from bounding Rectangle of map
            let boundingMapRect = overlay.boundingMapRect
            let rectangle = rect(for: boundingMapRect)
            
            //Setup Image for rendering in context of map
            context.scaleBy(x: 1.0, y: -1.0)
            context.translateBy(x: 0.0, y: rectangle.size.height)
            context.draw(cgImage, in: rectangle)
        }
        else
        {
            print("Error extracting image from GreenGrid")
        }
        
    }
}

