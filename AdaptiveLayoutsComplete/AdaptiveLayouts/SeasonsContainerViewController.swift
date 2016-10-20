//
//  SeasonsContainerViewController.swift
//  AdaptiveLayouts
//
//  Created by Jarrod Parkes on 10/19/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

// NOTE: Adaptation of Apple's sample code: developer.apple.com/library/prerelease/content/samplecode/AdaptiveElements/Introduction/Intro.html

import UIKit

// MARK: - SeasonsContainerViewController: UIViewController

class SeasonsContainerViewController: UIViewController {

    // MARK: Properties
    
    var currentSeasonViewController: UIViewController? = nil
    
    // MARK: Life Cycle
    
    override func viewWillLayoutSubviews() {
        /*
         In viewWillLayoutSubviews, we are guaranteed that our view's size, traits, etc. are up to date.
         It's a good place to update anything that affects the layout of our subviews.
         However, be careful, because this method is called frequently!
         Do as little work as possible, and don't invalidate the layout of any superviews.
         */
        if traitCollection.verticalSizeClass == .compact {
            switchToSeasonsViewController(withIdentifier: "seasonsLandscapeVC")
        } else {
            switchToSeasonsViewController(withIdentifier: "seasonsPortraitPageVC")
        }
    }
    
    func switchToSeasonsViewController(withIdentifier: String) {

        // remove existing seasons controller
        if let currentSeasonViewController = currentSeasonViewController {
            removeOldViewController(currentSeasonViewController)
        }
        
        // create new seasons controller
        let storyboard = UIStoryboard(name: "Seasons", bundle: nil)
        let newSeasonsViewController = storyboard.instantiateViewController(withIdentifier: withIdentifier)
        
        // add seasons controller as a child view controller of this container
        addNewViewController(newSeasonsViewController)
        
        // remember it, so we can remove it later
        currentSeasonViewController = newSeasonsViewController
        currentSeasonViewController?.view.frame = self.view.bounds
        currentSeasonViewController?.view.setNeedsDisplay()
    }
    
    /*
     Helper functions to be a well-behaved container view controller:
     */
    func addNewViewController(_ seasonViewController: UIViewController)
    {
        // Step 1: Add this view controller to our list of child view controllers.
        //         This will call elementViewController.willMove(toParentViewController: self).
        addChildViewController(seasonViewController)
        
        // Step 2: Add the view controller's view to our view hierarchy.
        view.addSubview(seasonViewController.view)
        
        // Step 3: Tell the view controller that it has moved, and `self` is the new parent.
        seasonViewController.didMove(toParentViewController: self)
    }
    
    func removeOldViewController(_ seasonViewController: UIViewController)
    {
        // Step 1: Tell the view controller that it will move to having no parent view controller.
        seasonViewController.willMove(toParentViewController: nil)
        
        // Step 2: Remove the view controller's view from our view hierarchy.
        seasonViewController.view.removeFromSuperview()
        
        // Step 3: Remove the view controller from our list of child view controllers.
        //         This will call elementViewController.didMove(toParentViewController: nil).
        seasonViewController.removeFromParentViewController()
    }
}
