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
        setupLocalization()
        setupTableView()
        bind()
        
        viewModel?.fetchComments()
    }
    
    // MARK: - Local Helpers
    
    private func setupLocalization() {
        self.title = i18n.commentsTitle
    }
    
    private func setupTableView() {
        
//        tableView.delegate = self
//        tableView.dataSource = self

        // Register Header
        //tableView.register(UINib(nibName: AuthorHeaderView.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: AuthorHeaderView.identifier)
        
        // Register Cells
        //tableView.register(UINib.nib(named: PostCell.identifier), forCellReuseIdentifier: PostCell.identifier)
    }
    
    private func bind() {
        
        viewModel?.comments.bind { [unowned self] in
            if $0.count > 0 {
                self.tableView.reloadData()
            }
        }
    }
}
