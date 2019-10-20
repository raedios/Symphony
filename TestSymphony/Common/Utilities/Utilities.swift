//
//  Utilities.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

fileprivate let symphonyDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

struct Utilities {
    
    /// Convert String date to Date Object
    /// - Parameter string: String Date
    func date(from string: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = symphonyDateFormat
        return dateFormatter.date(from: string)
    }
}
