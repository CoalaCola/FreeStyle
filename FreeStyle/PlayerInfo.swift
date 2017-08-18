//
//  PlayerInfo.swift
//  FreeStyle
//
//  Created by Vince Lee on 2017/8/16.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import Foundation
import MapKit
import Contacts


class Player: NSObject, MKAnnotation{
    let title: String?
    let asKnownAs:String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var image: UIImage
    let number: Int
    var slang: String
    var markerTintColor: UIColor  {
        switch discipline {
        case "top player":
            return .blue
        case "Mural":
            return .cyan
        case "Plaque":
            return .blue
        case "Sculpture":
            return .purple
        default:
            return .green
        }
    }
    
    init(title: String, asKnownAs: String, discipline: String, coordinate: CLLocationCoordinate2D, image: UIImage, number: Int, slang: String){
    self.title = title
    self.asKnownAs = asKnownAs
    self.discipline = discipline
    self.coordinate = coordinate
    self.image = image
    self.number = number
        self.slang = slang
        var imageName: String? {
            if discipline == "top player" { return "Statue" }
            return "Woody"
        }
    
    super.init()
}

    var subtitle: String? {
    return asKnownAs
}
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
