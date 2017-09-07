//
//  ViewController.swift
//  FreeStyle
//
//  Created by Vince Lee on 2017/8/15.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var players = [Player]()
   
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        players.append(Player(title: "Woody", asKnownAs: "Breaker Of the Chain", discipline: "top player", coordinate: CLLocationCoordinate2D(latitude: 25.0227, longitude: 121.5477), image: #imageLiteral(resourceName: "Woody"), number: 0, slang: "Im a Tiger."))
        players.append(Player(title: "Chu", asKnownAs: "doctor", discipline: "top player", coordinate: CLLocationCoordinate2D(latitude: 25.0235, longitude: 121.5491), image: #imageLiteral(resourceName: "Chu"), number: 1, slang: "I'm a God."))
        
        
        let initialLocation = CLLocation(latitude: 25.0221, longitude: 121.5481)
        
        let regionRadius: CLLocationDistance = 400
        func centerMapOnLocation(location: CLLocation){
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self
       
        
        

        mapView.addAnnotations(players)
        
        mapView.register(ArtworkMarkerView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }

   
    }

extension ViewController: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Player else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        
        
        if (view.annotation?.title)! == "Woody"{
       
            if let controller = storyboard?.instantiateViewController(withIdentifier: "WoodyDialog"){
                navigationController?.pushViewController(controller, animated: true)
            }
        }
        else if  (view.annotation?.title)! == "Chu"{
            if let controller = storyboard?.instantiateViewController(withIdentifier: "ChuDialog"){
                navigationController?.pushViewController(controller, animated: true)
            }
        
        }
       
    
   
}
}
