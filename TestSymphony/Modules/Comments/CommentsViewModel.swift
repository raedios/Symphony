//
//  CommentsViewModel.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

class CommentsViewModel {
    
    // MARK: - Properties
    
    private var router: CommentsRouter.Routes?
    private var post: Post
    
    // MARK: -
    
    var comments: Box<[Comment]> = Box([Comment]())
    
    // MARK: - Init
    
    init(router: CommentsRouter.Routes, post: Post) {
        self.router = router
        self.post = post
    }
    
}

// MARK: - Requests

extension CommentsViewModel {
    
    func fetchComments() {
        
        CommentsServices().fetchComments(ofPost: post) { (result, _) in
            
            switch result {
            case .success(let comments):
                self.comments.value = comments?.sorted (by: { $0.date < $1.date }) ?? [Comment]()
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
