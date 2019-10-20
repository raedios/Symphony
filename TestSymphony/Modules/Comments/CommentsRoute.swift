//
//  CommentsRoute.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

protocol CommentsRoute {
    
    var CommentsRouteTransition: Transition { get }
    func openComments(ofPost post: Post)
}

extension CommentsRoute where Self: RouterProtocol {

    var CommentsRouteTransition: Transition {
        return PushTransition()
    }

    func openComments(ofPost post: Post) {
        
        let router = CommentsRouter()
        let viewModel = CommentsViewModel(router: router, post: post)
        let viewController = CommentsViewController.instantiate(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = CommentsRouteTransition
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
