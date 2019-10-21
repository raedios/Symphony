//
//  CommentsViewModelTests.swift
//  TestSymphonyTests
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import XCTest
@testable import TestSymphony

class CommentsViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: CommentsViewModel!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStubFromBundle(withName: "Comments", extension: "json")
        let comments: [Comment] = try! JSONDecoder().decode([Comment].self, from: data)
        
        // Init Post
        let post = Post(id: 252,
                        date: "2017-11-07T20:58:03.784Z",
                        title: "Nihil consequatur modi voluptas qui est numquam iure perspiciatis.",
                        body: "Beatae eligendi laborum eos et sed sint iure autem dolores. Suscipit ut provident voluptatem voluptatem labore ut suscipit est qui. Aspernatur possimus dolore.",
                        imageUrl: "https://picsum.photos/id/480/640/480",
                        authorId: 2)
        
        // Initialize View Model
        let router = CommentsRouter()
        sut = CommentsViewModel(router: router, post: post)
        sut.comments.value = comments
    }

    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testSectionCount() {
        XCTAssertEqual(sut.sectionCount, 2)
    }
    
    func testRowCountForFirstSection() {
        XCTAssertEqual(sut.rowsCount(for: 0), 1)
    }
    
    func testRowCountForSecondSection() {
        XCTAssertEqual(sut.rowsCount(for: 1), sut.comments.value.count)
    }
    
    func testPostDetailViewModel() {
        
        let postViewModel = sut.postDetailViewModel()
        XCTAssertEqual(postViewModel.imageUrl, "https://picsum.photos/id/480/640/480")
        XCTAssertEqual(postViewModel.title, "Nihil consequatur modi voluptas qui est numquam iure perspiciatis.")
        XCTAssertEqual(postViewModel.body, "Beatae eligendi laborum eos et sed sint iure autem dolores. Suscipit ut provident voluptatem voluptatem labore ut suscipit est qui. Aspernatur possimus dolore.")
        XCTAssertEqual(postViewModel.date, "Nov 07, 2017")
    }
}
