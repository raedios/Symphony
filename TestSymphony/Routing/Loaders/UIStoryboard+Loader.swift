//
//  UIStoryboard+Loader.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

// MARK: - Storyboards

enum Storyboard : String {
    case main = "Main"
}

// MARK: - Loader Methods

extension UIStoryboard {
    
    /// Load a View Controller from a specific Storyboard
    ///
    /// - Parameters:
    ///   - storyboard: Storyboard
    ///   - viewController: View Controller Type to load
    /// - Returns: View Controller
    static func load(from storyboard: Storyboard, viewController: UIViewController.Type) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: String(describing: viewController.self))
    }
}
