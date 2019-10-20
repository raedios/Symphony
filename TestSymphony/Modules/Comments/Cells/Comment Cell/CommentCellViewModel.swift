//
//  CommentCellViewModel.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct CommentCellViewModel {
    
    // MARK: - Properties
    
    let comment: Comment
    
    // MARK: - Public Interfaces
    
    var avatarUrl: String {
        return comment.avatarUrl
    }
    
    var userName: String {
        return comment.userName
    }
    
    var body: String {
        return comment.body
    }
    
    var date: String {
        let date = Utilities().date(from: comment.date)
        return date?.toString() ?? ""
    }
}
