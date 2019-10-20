//
//  PostsRoute.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

protocol PostsRoute {
    
    var postsRouteTransition: Transition { get }
    func openPosts(ofAuthor author: Author)
}

extension PostsRoute where Self: RouterProtocol {

    var postsRouteTransition: Transition {
        return PushTransition()
    }

    func openPosts(ofAuthor author: Author) {
        
        let router = PostsRouter()
        let viewModel = PostsViewModel(router: router, author: author)
        let viewController = PostsViewController.instantiate(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = postsRouteTransition
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
