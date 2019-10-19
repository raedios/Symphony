//
//  PostsServices.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

class PostsServices: NetworkingAPI {
    
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
    
    func fetchPosts(ofAuthor author: Author, completion: @escaping (Result<[Post]?, APIError>, URLResponse?) -> Void) {
        
        let endPoint = Posts.postsOf(authorId: author.id)
        
        fetch(with: endPoint.request, decode: { json -> [Post]? in
            
            guard let posts = json as? [Post] else { return  nil }
            return posts
        }, completion: completion)
    }
}
