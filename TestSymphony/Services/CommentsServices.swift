//
//  CommentsServices.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-20.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

class CommentsServices: NetworkingAPI {
    
    // MARK: - Properties
    
    var session: URLSession
    
    // MARK: - Inits
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    // MARK: - Requests
    
    func fetchComments(ofPost post: Post, completion: @escaping (Result<[Comment]?, APIError>, URLResponse?) -> Void) {
        
        let endPoint = Comments.commentsOf(postId: post.id)
        
        fetch(with: endPoint.request, decode: { json -> [Comment]? in
            
            guard let comments = json as? [Comment] else { return  nil }
            return comments
        }, completion: completion)
    }
}
