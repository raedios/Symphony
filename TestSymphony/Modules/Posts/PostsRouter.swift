//
//  PostsRouter.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

final class PostsRouter: Router<PostsViewController>, CommentsRoute {
    
    typealias Routes = Closable & CommentsRoute
}
