//
//  AuthorsViewModelTests.swift
//  TestSymphonyTests
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import XCTest
@testable import TestSymphony

class AuthorsViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: AuthorsViewModel!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStubFromBundle(withName: "Authors", extension: "json")
        let authors: [Author] = try! JSONDecoder().decode([Author].self, from: data)
        
        // Initialize View Model
        let router = AuthorsRouter()
        sut = AuthorsViewModel(router: router)
        sut.authors.value = authors
    }

    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAuthorsCount() {
        XCTAssertEqual(sut.rowsCount, 20)
    }
    
    func testIsLastPage() {
        XCTAssertFalse(sut.isLastPage)
    }

    func testAuthorViewModel() {
        
        let authorViewModel = sut.authorViewModel(atIndex: 2)
        
        XCTAssertEqual(authorViewModel.avatarUrl, "https://s3.amazonaws.com/uifaces/faces/twitter/jamiebrittain/128.jpg")
        XCTAssertEqual(authorViewModel.email, "robbie_kihn@yahoo.com")
        XCTAssertEqual(authorViewModel.name, "Lena Grant")
        XCTAssertEqual(authorViewModel.userName, "Rosalind_Morar")
    }
}
