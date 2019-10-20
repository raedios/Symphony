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
    
    @IBOutlet var tableView: UITableView!
    
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
        setupLocalization()
        setupTableView()
        bind()
        
        viewModel?.fetchPosts()
    }
    
    // MARK: - Local Helpers
    
    private func setupLocalization() {
        self.title = i18n.authorsTitle
    }
    
    private func setupTableView() {
        
        //tableView.delegate = self
        //tableView.dataSource = self
        
        // Register Cells
        //tableView.register(UINib.nib(named: AuthorCell.identifier), forCellReuseIdentifier: AuthorCell.identifier)
    }
    
    private func bind() {
        
        viewModel?.posts.bind { [unowned self] in
            if $0.count > 0 {
                self.tableView.reloadData()
            }
        }
    }
}
