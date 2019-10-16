//
//  AuthorsServices.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

class AuthorsServices: NetworkingAPI {
    
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
    
    func fetchAuthors(atPage page: String, completion: @escaping (Result<[Author]?, APIError>) -> Void) {
        
        let endPoint = Authors.authors(at: page)
        
        fetch(with: endPoint.request, decode: { json -> [Author]? in
            
            guard let authors = json as? [Author] else { return  nil }
            return authors
        }, completion: completion)
    }
}
