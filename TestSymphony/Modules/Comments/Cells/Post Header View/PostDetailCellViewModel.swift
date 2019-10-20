//
//  PostDetailCellViewModel.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct PostDetailCellViewModel {
    
    // MARK: - Properties
    
    let post: Post
    
    // MARK: - Public Interfaces
    
    var imageUrl: String {
        return post.imageUrl
    }
    
    var title: String {
        return post.title
    }
    
    var body: String {
        return post.body
    }
    
    var date: String {
        let date = Utilities().date(from: post.date)
        return date?.toString() ?? ""
    }
}
