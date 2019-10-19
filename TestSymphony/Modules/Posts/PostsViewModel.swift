//
//  PostsViewModel.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

class PostsViewModel {
    
    // MARK: - Properties
    
    private var router: PostsRouter.Routes?
    private var author: Author
    
    // MARK: - Init
    
    init(router: PostsRouter.Routes, author: Author) {
        self.router = router
        self.author = author
    }
    
}
