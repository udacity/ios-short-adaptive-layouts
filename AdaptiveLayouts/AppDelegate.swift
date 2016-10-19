//
//  AppDelegate.swift
//  AdaptiveLayouts
//
//  Created by Jarrod Parkes on 10/16/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

// MARK: - AppDelegate: UIResponder, UIApplicationDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
    
    var window: UIWindow?

    // MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let pageControlApperance = UIPageControl.appearance()
        pageControlApperance.currentPageIndicatorTintColor = .black
        pageControlApperance.pageIndicatorTintColor = .lightGray
        return true
    }
}
