//
//  DisplayAedsTabBarController.swift
//  AED Locator
//
//  Created by Sean Hickey on 3/6/16.
//  Copyright © 2016 GeoCode2016. All rights reserved.
//

import UIKit

class DisplayAedsTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if viewController.title == "AddAedDummyVC" {
            let storyboard = UIStoryboard(name: "AddAed", bundle: nil)
            let actualController = storyboard.instantiateViewControllerWithIdentifier("AddAedNavController") as! UINavigationController
            presentViewController(actualController, animated: true, completion: nil)
            return false
        }
        return true
    }


}
