//
//  AuthorsRoute.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct AuthorsRoute {
    
    func viewController() -> AuthorsViewController {
        
        let router = AuthorsRouter()
        let viewModel = AuthorsViewModel(router: router)
        let viewController = AuthorsViewController.instantiate(viewModel: viewModel)
        router.viewController = viewController
        
        return viewController
    }
}
