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
    
    // MARK: - Init
    
    init(router: CommentsRouter.Routes, post: Post) {
        self.router = router
        self.post = post
    }
    
}
