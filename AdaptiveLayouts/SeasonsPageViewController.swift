//
//  SeasonsPageViewController.swift
//  AdaptiveLayouts
//
//  Created by Jarrod Parkes on 10/19/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

// MARK: - SeasonsPageViewController: UIPageViewController

class SeasonsPageViewController: UIPageViewController {
    
    // MARK: Properties
    
    var seasonViewControllers = [UIViewController]()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonViewControllers.append(createSeasonsPortraitViewController())
        seasonViewControllers.append(createSeasonsPortraitViewController())
        seasonViewControllers.append(createSeasonsPortraitViewController())
        seasonViewControllers.append(createSeasonsPortraitViewController())
        
        setViewControllers([seasonViewControllers[0]], direction: .forward, animated: false, completion: nil)
                        
        dataSource = self
    }
    
    // MARK: Create Example View Controllers
    
    func createSeasonsPortraitViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Seasons", bundle: nil)
        let newSeasonsPortraitViewController = storyboard.instantiateViewController(withIdentifier: "seasonsPortrait")
        return newSeasonsPortraitViewController
    }
}

// MARK: - SeasonsPageViewController: UIPageViewControllerDataSource

extension SeasonsPageViewController: UIPageViewControllerDataSource {
    
    // MARK: Moving Between Pages
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = seasonViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard seasonViewControllers.count > previousIndex else {
            return nil
        }
        
        return seasonViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = seasonViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let filterViewControllersCount = seasonViewControllers.count
        
        guard filterViewControllersCount != nextIndex else {
            return nil
        }
        
        guard filterViewControllersCount > nextIndex else {
            return nil
        }
        
        return seasonViewControllers[nextIndex]
    }
    
    // MARK: Show Page Control
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return seasonViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = seasonViewControllers.index(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }
}
