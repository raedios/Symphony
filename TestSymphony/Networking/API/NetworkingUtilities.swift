//
//  NetworkingUtilities.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-17.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct NetworkingUtilities {
    
    func extractNextPageFrom(response: URLResponse) -> String? {
        
        guard let httpUrlResponse = response as? HTTPURLResponse else { return nil }
        
        if let linkHeader = httpUrlResponse.allHeaderFields["Link"] as? String {
            
            let links = linkHeader.components(separatedBy: ",")
            
            var dictionary: [String: String] = [:]
            links.forEach({
                let components = $0.components(separatedBy:"; ")
                let cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "< >"))
                let urlComponents = cleanPath.components(separatedBy: "?").last
                let nextPageComponent = urlComponents!.components(separatedBy: "&").first
                let nextPage = nextPageComponent!.components(separatedBy: "=").last
                dictionary[components[1]] = nextPage
            })
            
            if let nextPage = dictionary["rel=\"next\""] {
                print("nextPagePath: \(nextPage)")
                return nextPage
            }
        }

        return nil
    }
}
