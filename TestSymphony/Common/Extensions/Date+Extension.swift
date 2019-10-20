//
//  Date+Extension.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

fileprivate let displayDateFormat = "MMM dd, yyyy"

extension Date {
    
    func toString() -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = displayDateFormat
        return dateFormatter.string(from: self)
    }
}
