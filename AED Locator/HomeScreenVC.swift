//
//  ViewController.swift
//  AED Locator
//
//  Created by Sean Hickey on 3/5/16.
//  Copyright © 2016 GeoCode2016. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeScreenVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var foundLocation : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for aed in DummyData {
            let pin = MKPointAnnotation()
            pin.coordinate = CLLocationCoordinate2D(latitude: aed.lat, longitude: aed.lon)
            mapView.addAnnotation(pin)
        }
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
        }
        
        // TODO : Handle when not authorized
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        if !foundLocation {
            let span = MKCoordinateSpanMake(0.25, 0.25)
            let region = MKCoordinateRegionMake(newLocation.coordinate, span)
            mapView.setRegion(region, animated: true)
            foundLocation = true
        }
        
        
    }


}

