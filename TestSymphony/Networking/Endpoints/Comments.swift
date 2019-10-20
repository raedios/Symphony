//
//  Comments.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

enum Comments {
    case commentsOf(postId: Int)
}

extension Comments: Endpoint {
    
    var base: String {
        return APIConstents.baseUrl
    }
    
    var path: String {
        switch self {
        case .commentsOf(let postId):
            return "/posts/\(postId)/comments"
        }
    }
    
    var urlQueryItems: [URLQueryItem]? {
        switch self {
        case .commentsOf( _):
            
            var urlQueryItem = [URLQueryItem]()
            
            urlQueryItem.append(URLQueryItem(name: "_sort", value: "date"))
            urlQueryItem.append(URLQueryItem(name: "_order", value: "asc"))
            
            return urlQueryItem
        }
    }
}
