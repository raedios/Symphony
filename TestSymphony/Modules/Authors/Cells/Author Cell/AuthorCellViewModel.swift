//
//  AuthorCellViewModel.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct AuthorCellViewModel {
    
    // MARK: - Properties
    
    let author: Author
    
    // MARK: - Public Interfaces
    
    var avatarUrl: String {
        return author.avatarUrl
    }
    
    var name: String {
        return author.name
    }
    
    var userName: String {
        return author.userName
    }
    
    var email: String {
        return author.email
    }
}
