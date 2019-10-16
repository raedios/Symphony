//
//  AuthorsViewController.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class AuthorsViewController: UIViewController {

    // MARK: - Views
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    
    private var viewModel: AuthorsViewModel?
    
    // MARK: - Init
    
    static func instantiate(viewModel: AuthorsViewModel) -> AuthorsViewController {
        
        let viewController = UIStoryboard.load(from: .main, viewController: self) as! AuthorsViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bind()
        
        viewModel?.fetchAuthors()
    }
    
    // MARK: - Local Helpers
    
    private func setupTableView() {
        
        //tableView.delegate = self
        tableView.dataSource = self
        
        // Register Cell
        tableView.register(UINib.nib(named: AuthorCell.identifier), forCellReuseIdentifier: AuthorCell.identifier)
    }
    
    private func bind() {
        
        viewModel?.authors.bind { [unowned self] in
            if $0.count > 0 {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableView DataSource Methods

extension AuthorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = viewModel else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AuthorCell.identifier) as? AuthorCell else { return UITableViewCell() }
        
        // Get the author and configure the cell
        let author = viewModel.authorViewModel(atIndex: indexPath.row)
        cell.configure(with: author)
        
        return cell
    }
}