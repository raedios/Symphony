//
//  UINib+Loader.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

// MARK: - Loader Methods

extension UINib {
    
    /// Load Nib with name
    ///
    /// - Parameter nibName: Nib name
    /// - Returns: UINib
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    /// Load Nib with name and attach it to owner
    ///
    /// - Parameters:
    ///   - nibName: Nib name
    ///   - owner: Owner
    /// - Returns: UINib
    static func loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}
