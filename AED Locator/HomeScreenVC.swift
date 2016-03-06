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

class HomeScreenVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var foundLocation : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "locationUpdated", name: Notifications.LocationDidUpdate, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for aed in DummyData {
            let pin = MKPointAnnotation()
            pin.coordinate = CLLocationCoordinate2D(latitude: aed.lat, longitude: aed.lon)
            mapView.addAnnotation(pin)
        }
        
    }
    
    func locationUpdated() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let newLocation = appDelegate.currentLocation
        
        if !foundLocation {
            let span = MKCoordinateSpanMake(0.25, 0.25)
            let region = MKCoordinateRegionMake(newLocation!.coordinate, span)
            mapView.setRegion(region, animated: true)
            foundLocation = true
        }
    }

}

