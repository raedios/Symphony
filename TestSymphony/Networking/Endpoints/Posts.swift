//
//  Posts.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

enum Posts {
    case postsOf(authorId: Int)
}

extension Posts: Endpoint {
    
    var base: String {
        return APIConstents.baseUrl
    }
    
    var path: String {
        switch self {
        case .postsOf( _):
            return "/posts"
        }
    }
    
    var urlQueryItems: [URLQueryItem]? {
        switch self {
        case .postsOf(let authorId):
            
            var urlQueryItem = [URLQueryItem]()
            
            urlQueryItem.append(URLQueryItem(name: "authorId", value: String(authorId)))
            
            return urlQueryItem
        }
    }
}
