//
//  RadarTile.swift
//  DragonBallAR
//
//  Created by User on 9/6/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit
import MapKit
class RadarTile:  MKTileOverlay
{
    override func url(forTilePath path: MKTileOverlayPath) -> URL {
        let resourcePath = Bundle.main.resourcePath
        let imgName = "green grid.png"
        let path = resourcePath! + "/" + imgName
        return URL(fileURLWithPath: path)
    }
    
}
