//
//  AuthorHeaderView.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class AuthorHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Type Properties
    
    static let identifier = "AuthorHeaderView"
    
    // MARK: - Views
    
    @IBOutlet var avatarImage: CustomImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Configure
    
    func configure(with viewModel: AuthorCellViewModel) {
        
        // Load profile Image
        avatarImage.loadImageUsing(urlString: viewModel.avatarUrl, completion: nil)
        
        self.nameLabel.text = viewModel.name
        self.userNameLabel.text = viewModel.userName
        self.emailLabel.text = viewModel.email
    }
    
    // MARK: - Local Helpers
    
    private func setupUI() {
        avatarImage.makeRounded()
    }
}
