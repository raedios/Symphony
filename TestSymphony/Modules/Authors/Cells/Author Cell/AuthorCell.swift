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
    
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Configuration
    
    func configure(with viewModel: AuthorCellViewModel) {
        
        self.nameLabel.text = viewModel.name
        self.userNameLabel.text = viewModel.userName
        self.emailLabel.text = viewModel.email
    }
}
