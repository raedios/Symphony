//
//  AuthorCell.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class AuthorCell: UITableViewCell {
    
    // MARK: - Type Properties
    
    static let identifier = "AuthorCell"
    
    // MARK: - Views
    
    @IBOutlet var avatarImage: CustomImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Configuration
    
    func configure(with viewModel: AuthorCellViewModel) {
        
        // Load profile Image
        showActivityIndicator()
        avatarImage.loadImageUsing(urlString: viewModel.avatarUrl) {
            self.hideActivityIndicator()
        }
        
        self.nameLabel.text = viewModel.name
        self.userNameLabel.text = viewModel.userName
        self.emailLabel.text = viewModel.email
    }
    
    // MARK: - Local Helpers
    
    private func showActivityIndicator() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func hideActivityIndicator() {
        
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}
