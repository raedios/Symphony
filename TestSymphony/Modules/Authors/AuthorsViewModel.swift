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
    
    // MARK: -
    
    var authors: Box<[Author]> = Box([Author]())

    // MARK: - Init
    
    init(router: AuthorsRouter.Routes) {
        self.router = router
    }
    
    // MARK: - Public Inerfaces
    
    var rowsCount: Int {
        return authors.value.count
    }
    
    // MARK: - Functions
    
    func authorViewModel(atIndex index: Int) -> AuthorCellViewModel {
        return AuthorCellViewModel(author: authors.value[index])
    }
}

// MARK: - Requests

extension AuthorsViewModel {
    
    func fetchAuthors() {
        
        AuthorsServices().fetchAuthors(atPage: "6") { result in
            
            switch result {
            case .success(let authors):
                self.authors.value.append(contentsOf: authors ?? [Author]())
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
