//
//  NearestAedVC.swift
//  AED Locator
//
//  Created by Sean Hickey on 3/6/16.
//  Copyright © 2016 GeoCode2016. All rights reserved.
//

import UIKit
import CoreLocation

class NearestAedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "locationDidUpdate", name: Notifications.LocationDidUpdate, object: nil)
    }
    
    func locationDidUpdate() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let location = appDelegate.currentLocation
    }
    

}
