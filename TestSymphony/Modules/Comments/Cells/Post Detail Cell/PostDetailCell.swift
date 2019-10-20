//
//  PostDetailCell.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class PostDetailCell: UITableViewCell {
    
    // MARK: - Type Properties
    
    static let identifier = "PostDetailCell"
    
    // MARK: - Views
    
    @IBOutlet var postImage: CustomImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var titleView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Configuration
    
    func configure(with viewModel: PostCellViewModel) {
        
        // Load profile Image
        showActivityIndicator()
        postImage.loadImageUsing(urlString: viewModel.imageUrl) {
            self.hideActivityIndicator()
        }
        
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
        dateLabel.text = viewModel.date
    }
    
    // MARK: - Local Helpers
    
    private func setupUI() {
        imageView?.contentMode = .scaleAspectFill
        titleView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
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
