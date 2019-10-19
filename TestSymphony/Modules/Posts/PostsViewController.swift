//
//  PostsViewController.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    // MARK: - Views
    
    // MARK: - Properties
    
    private var viewModel: PostsViewModel?
    
    // MARK: - Init
    
    static func instantiate(viewModel: PostsViewModel) -> PostsViewController {
        
        let viewController = UIStoryboard.load(from: .main, viewController: self) as! PostsViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
