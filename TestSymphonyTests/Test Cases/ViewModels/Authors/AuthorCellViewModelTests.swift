//
//  AuthorCellViewModelTests.swift
//  TestSymphonyTests
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import XCTest
@testable import TestSymphony

class AuthorCellViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: AuthorCellViewModel!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStubFromBundle(withName: "Authors", extension: "json")
        let authors: [Author] = try! JSONDecoder().decode([Author].self, from: data)
        
        // Initialize View Model
        sut = AuthorCellViewModel(author: authors[7])
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAvatarUrl() {
        XCTAssertEqual(sut.avatarUrl, "https://s3.amazonaws.com/uifaces/faces/twitter/ganserene/128.jpg")
    }
    
    func testName() {
        XCTAssertEqual(sut.name, "Leona Mante")
    }
    
    func testUserName() {
        XCTAssertEqual(sut.userName, "Stewart.Morar39")
    }
    
    func testEmail() {
        XCTAssertEqual(sut.email, "aiden_batz25@hotmail.com")
    }
}
