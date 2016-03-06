//
//  Constants.swift
//  AED Locator
//
//  Created by Sean Hickey on 3/5/16.
//  Copyright © 2016 GeoCode2016. All rights reserved.
//

import Foundation
import CoreLocation

struct Notifications {
    static let LocationDidUpdate = "AEDLocationDidUpdateNotification"
}

struct AppConstants {
    
    struct Networking {
        
        static let BaseUrl = ""
        
    }
    
}


struct Aed {
    
    let lat : Double
    let lon : Double
    let image : [UInt8]?
    let description : String
    let expiration : String
    
}