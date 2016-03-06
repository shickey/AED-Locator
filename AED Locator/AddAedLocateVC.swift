//
//  AddAedLocateVC.swift
//  AED Locator
//
//  Created by Sean Hickey on 3/5/16.
//  Copyright © 2016 GeoCode2016. All rights reserved.
//

import UIKit
import MapKit

class AddAedLocateVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let location = appDelegate.currentLocation
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(location!.coordinate, span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
