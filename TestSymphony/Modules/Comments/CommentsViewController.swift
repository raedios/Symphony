//
//  CommentsViewController.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    
    private var viewModel: CommentsViewModel?
    
    // MARK: - Init
    
    static func instantiate(viewModel: CommentsViewModel) -> CommentsViewController {
        
        let viewController = UIStoryboard.load(from: .main, viewController: self) as! CommentsViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
