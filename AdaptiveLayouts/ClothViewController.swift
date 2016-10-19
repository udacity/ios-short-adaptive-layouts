//
//  ClothViewController.swift
//  AdaptiveLayouts
//
//  Created by Jarrod Parkes on 10/16/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

// MARK: - ClothViewController: UIViewController

class ClothViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var labelStackView: UIStackView!
    
    // MARK: Vary Interface Based on Traits
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.verticalSizeClass == .compact {
            labelStackView.setNeedsLayout()
        }
    }
}
