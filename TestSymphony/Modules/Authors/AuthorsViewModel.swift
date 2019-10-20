//
//  AuthorsViewModel.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

class AuthorsViewModel {
    
    // MARK: - Properties
    
    private var router: AuthorsRouter.Routes?
    private var currentPage: String = "0"
    private var nextPage: String = "1"
    
    // MARK: -
    
    var authors: Box<[Author]> = Box([Author]())
    var fetchingMore = false

    // MARK: - Init
    
    init(router: AuthorsRouter.Routes) {
        self.router = router
    }
    
    // MARK: - Public Inerfaces
    
    var sectionsCount: Int {
        return 1
    }
    
    var rowsCount: Int {
        return authors.value.count
    }
    
    var isLastPage: Bool {
        return Int(currentPage)! >= Int(nextPage)!
    }
    
    // MARK: - Functions
    
    func authorViewModel(atIndex index: Int) -> AuthorCellViewModel {
        return AuthorCellViewModel(author: authors.value[index])
    }
    
    // MARK: - Rounting
    
    func openAuthorsPosts(atIndex index: Int) {
        router?.openPosts(ofAuthor: authors.value[index])
    }
}

// MARK: - Requests

extension AuthorsViewModel {
    
    func fetchAuthors() {
        
        fetchingMore = true
        
        AuthorsServices().fetchAuthors(atPage: nextPage) { result, response  in
            
            switch result {
            case .success(let authors):
                
                self.authors.value.append(contentsOf: authors ?? [Author]())
                
                if let response = response, let nextPage = NetworkingUtilities().extractNextPageFrom(response: response) {
                    
                    // Set the next page to load
                    self.currentPage = self.nextPage
                    self.nextPage = nextPage
                } else {
                    
                    // We've reached last page
                    self.currentPage = self.nextPage
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
