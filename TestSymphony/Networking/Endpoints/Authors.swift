//
//  Authors.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

enum Authors {
    case authors(at: String)
}

extension Authors: Endpoint {
    
    var base: String {
        return APIConstents.baseUrl
    }
    
    var path: String {
        switch self {
        case .authors( _):
            return "/authors"
        }
    }
    
    var urlQueryItems: [URLQueryItem]? {
        switch self {
        case .authors(let page):
            
            var urlQueryItem = [URLQueryItem]()
            
            urlQueryItem.append(URLQueryItem(name: "_page", value: page))
            urlQueryItem.append(URLQueryItem(name: "_limit", value: maxRecordsPerRequest))
            
            return urlQueryItem
        }
    }
}
