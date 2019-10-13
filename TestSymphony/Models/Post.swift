//
//  Post.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct Post: Decodable {
    
    // MARK: - Properties
    
    var id: Int
    var date: Date
    var title: String
    var body: String
    var imageUrl: String
    var authorId: Int
}
