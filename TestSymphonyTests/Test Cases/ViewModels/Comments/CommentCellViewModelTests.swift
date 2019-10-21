//
//  CommentCellViewModelTests.swift
//  TestSymphonyTests
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import XCTest
@testable import TestSymphony

class CommentCellViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: CommentCellViewModel!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStubFromBundle(withName: "Comments", extension: "json")
        let comments: [Comment] = try! JSONDecoder().decode([Comment].self, from: data)
        
        // Initialize View Model
        sut = CommentCellViewModel(comment: comments[7])
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAvatarUrl() {
        XCTAssertEqual(sut.avatarUrl, "https://s3.amazonaws.com/uifaces/faces/twitter/geshan/128.jpg")
    }
    
    func testUserName() {
        XCTAssertEqual(sut.userName, "Lance39")
    }
    
    func testBody() {
        XCTAssertEqual(sut.body, "Perferendis provident dolorem recusandae atque voluptas voluptate a. Eos quod est aspernatur quam illum. Quidem fugit qui deleniti aperiam omnis eum maiores cupiditate.")
    }
    
    func testDate() {
        XCTAssertEqual(sut.date, "Feb 24, 2017")
    }
}
