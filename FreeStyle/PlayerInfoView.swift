//
//  PlayerInfoView.swift
//  FreeStyle
//
//  Created by Vince Lee on 2017/8/16.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import Foundation
import MapKit

class ArtworkMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            // 1
            guard let player = newValue as? Player else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            // 2
            markerTintColor = player.markerTintColor
            
//            glyphText = String(player.discipline.first!)
            
        }
    }
}
