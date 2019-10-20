//
//  XCTestCase+Extension.swift
//  TestSymphonyTests
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    /// Load local file
    ///
    /// - Parameters:
    ///   - name: File name
    ///   - extension: File extension
    /// - Returns: File data
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
