//
//  String+Extension.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-17.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Computed properties
    
    /// Localize a string
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
