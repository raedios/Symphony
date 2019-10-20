//
//  CommentCell.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    // MARK: - Type Properties
    
    static let identifier = "CommentCell"
    
    // MARK: - Views
    
    @IBOutlet var avatarImageView: CustomImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Configuration
    
    func configure(with viewModel: CommentCellViewModel) {
        
        // Load profile Image
        showActivityIndicator()
        avatarImageView.loadImageUsing(urlString: viewModel.avatarUrl) {
            self.hideActivityIndicator()
        }
        
        userNameLabel.text = viewModel.userName
        bodyLabel.text = viewModel.body
        dateLabel.text = viewModel.date
    }
    
    // MARK: - Local Helpers
    
    private func setupUI() {
        selectionStyle = .none
    }
    
    private func showActivityIndicator() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func hideActivityIndicator() {
        
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}
