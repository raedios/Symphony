//
//  CommentsViewController.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class CommentsViewController: BaseViewController {
    
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
        
        tableView.delegate = self
        tableView.dataSource = self

        // Register Cells
        tableView.register(UINib.nib(named: PostDetailCell.identifier), forCellReuseIdentifier: PostDetailCell.identifier)
        tableView.register(UINib.nib(named: CommentCell.identifier), forCellReuseIdentifier: CommentCell.identifier)
    }
    
    private func bind() {
        
        viewModel?.comments.bind { [unowned self] in
            if $0.count > 0 {
                self.tableView.reloadData()
            }
        }
        
        viewModel?.errorMessage.bind(listener: { [unowned self] in
            if !$0.isEmpty {
                self.showAlert(title: i18n.errorTitle, message: $0, defaultAction: i18n.okButton)
            }
        })
    }
}

// MARK: - UITableView DataSource Methods

extension CommentsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.rowsCount(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            return configurePostCell()
        } else {
            return configureCommentCell(at: indexPath.row)
        }
    }
    
    // MARK: - Cells Configutaion methods
    
    private func configurePostCell() -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostDetailCell.identifier) as? PostDetailCell else { return UITableViewCell() }
        
        // Get the author and configure the cell
        let post = viewModel!.postDetailViewModel()
        cell.configure(with: post)
        
        return cell
    }
    
    private func configureCommentCell(at index: Int) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier) as? CommentCell else { return UITableViewCell() }
        
        // Get the comment and configure the cell
        let comment = viewModel!.commentViewModel(atIndex: index)
        cell.configure(with: comment)
        
        return cell
    }
}

// MARK: - UITableView Delegate Methods

extension CommentsViewController: UITableViewDelegate {
    
    
}
