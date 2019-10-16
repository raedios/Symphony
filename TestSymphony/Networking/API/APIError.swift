//
//  APIError.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

// MARK: - API Error messages

enum APIError: Error {
    
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .invalidData:
            return "Invalid Data"
        case .responseUnsuccessful:
            return "Response Unsuccessful"
        case .jsonParsingFailure:
            return "JSON Parsing Failure"
        case .jsonConversionFailure:
            return "JSON Conversion Failure"
        }
    }
}
