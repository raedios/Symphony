//
//  AuthorsServicesTests.swift
//  TestSymphonyTests
//
//  Created by Raed MEZRAOUI on 19-10-21.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import XCTest
@testable import TestSymphony

class AuthorsServicesTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: AuthorsServices!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Init System Under Test
        sut = AuthorsServices()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testFetchAuthors() {
        
        // Set the expectation
        let expectation = self.expectation(description: "Fetch the authors")
        
        sut.fetchAuthors(atPage: "7") { (result, nil) in
            
            switch result {
            case .success(let authors):
                XCTAssertNotNil(authors, "Unexpected nil result!")
                XCTAssertEqual(authors!.count, 20)
            case .failure(let error):
                XCTAssertNil(error, "Unexpected error occured: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 3.0) { (error) in
            print("Error: \(error?.localizedDescription ?? "Request timeout!")")
        }
    }
}
