//
//  PostsViewModelTests.swift
//  TestSymphonyTests
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import XCTest
@testable import TestSymphony

class PostsViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: PostsViewModel!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStubFromBundle(withName: "Posts", extension: "json")
        let posts: [Post] = try! JSONDecoder().decode([Post].self, from: data)
        
        // Init Author
        let author = Author(id: 121,
                            name: "Roberta Mueller",
                            userName: "Trevion.Hodkiewicz",
                            email: "trystan_padberg@hotmail.com",
                            avatarUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/faisalabid/128.jpg",
                            address: Address(latitude: "-73.7506", longitude: "-62.5682"))
        
        // Initialize View Model
        let router = PostsRouter()
        sut = PostsViewModel(router: router, author: author)
        sut.posts.value = posts
    }

    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testRowCount() {
        XCTAssertEqual(sut.rowsCount, 15)
    }
    
    func testAuthorFirstNameCount() {
        XCTAssertEqual(sut.authorsFirstName, "Roberta")
    }
    
    func testAuthorViewModel() {
        
        let authorViewModel = sut.authorViewModel()
        XCTAssertEqual(authorViewModel.avatarUrl, "https://s3.amazonaws.com/uifaces/faces/twitter/faisalabid/128.jpg")
        XCTAssertEqual(authorViewModel.email, "trystan_padberg@hotmail.com")
        XCTAssertEqual(authorViewModel.name, "Roberta Mueller")
        XCTAssertEqual(authorViewModel.userName, "Trevion.Hodkiewicz")
    }
    
    func testPostViewModel() {
        
        let postViewModel = sut.postViewModel(atIndex: 7)
        XCTAssertEqual(postViewModel.body, "Porro aut sed dolorum occaecati totam est. Explicabo qui sed ut blanditiis voluptate repudiandae. Et sint non dolor delectus ipsam debitis et. Odio velit facilis rerum ducimus ut dolorem quaerat consequatur. Ut accusantium architecto.")
        XCTAssertEqual(postViewModel.date, "Aug 15, 2017")
        XCTAssertEqual(postViewModel.imageUrl, "https://picsum.photos/id/909/640/480")
        XCTAssertEqual(postViewModel.title, "Debitis praesentium et.")
    }
}
