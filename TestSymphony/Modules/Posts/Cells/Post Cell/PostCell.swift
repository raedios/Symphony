//
//  PostCell.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    // MARK: - Type Properties
    
    static let identifier = "PostCell"
    
    // MARK: - Views
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configuration
    
    func configure(with viewModel: PostCellViewModel) {
        
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
        dateLabel.text = viewModel.date
    }
}
