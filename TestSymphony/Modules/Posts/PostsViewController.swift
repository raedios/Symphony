//
//  PostsViewController.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

fileprivate let authorHeaderSectionHeight: CGFloat = 196.0

class PostsViewController: BaseViewController {
    
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
        self.title = String(format: i18n.postsTitle, viewModel?.authorsFirstName ?? "") 
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register Header
        tableView.register(UINib(nibName: AuthorHeaderView.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: AuthorHeaderView.identifier)
        
        // Register Cells
        tableView.register(UINib.nib(named: PostCell.identifier), forCellReuseIdentifier: PostCell.identifier)
    }
    
    private func bind() {
        
        viewModel?.posts.bind { [unowned self] in
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

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier) as? PostCell else { return UITableViewCell() }
        
        // Get the post and configure the cell
        let post = viewModel.postViewModel(atIndex: indexPath.row)
        cell.configure(with: post)
        
        return cell
    }
}

// MARK: - UITableView Delegate Methods

extension PostsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: AuthorHeaderView.identifier) as? AuthorHeaderView else { return UITableViewCell() }
        
        // Get the author and configure the view
        let author = viewModel!.authorViewModel()
        headerView.configure(with: author)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return authorHeaderSectionHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Open selected author's posts
        viewModel?.openPostsComments(atIndex: indexPath.row)
    }
}
