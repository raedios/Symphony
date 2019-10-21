//
//  i18n.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-17.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct i18n {
    
    // MARK: - Private Init
    
    private init() {}

    // MARK: - Titles

    static var authorsTitle: String { return "title.authors".localized }
    static var postsTitle: String { return "title.posts".localized }
    static var commentsTitle: String { return "title.comments".localized }
    
    // MARK: - Buttons

    static var okButton: String { return "button.ok".localized }

    // MARK: - Errors
    
    static var errorTitle: String { return "error.title".localized }
}
