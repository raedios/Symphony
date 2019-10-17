//
//  NetworkingAPI.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

// MARK: - API Constents

let maxRecordsPerRequest = "20"

// MARK: - API Protocol

protocol NetworkingAPI {
    
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>, URLResponse?) -> Void)
}

// MARK: - API Implementation

extension NetworkingAPI {
    
    typealias JSONTaskCompletionHandler = (Decodable?, URLResponse?, APIError?) -> Void
    
    /// Cell Request and Parse Data To JSON<T>, in case of an error returns the corresponding error information.
    ///
    /// - Parameters:
    ///   - request: URLRequest to execute
    ///   - decodingType: Decodable Object
    ///   - completion: A completion handler containing either the Decoded Object or an Error in case of failure
    /// - Returns: URLSessionDataTask
    func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, nil, .requestFailed)
                return
            }
            
            if let httpUrlResponse = response as? HTTPURLResponse {
                print("\(httpUrlResponse.allHeaderFields)") // Error
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, httpResponse, nil)
                    } catch {
                        completion(nil, httpResponse, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, httpResponse, .invalidData)
                }
            } else {
                completion(nil, httpResponse, .responseUnsuccessful)
            }
        }
        return task
    }
    
    /// Fetch data of a URLRequest and returns A decodable Object
    ///
    /// - Parameters:
    ///   - request: URLRequest to execute
    ///   - decode: Type of object to be decoded
    ///   - completion: A completion handler containing either the Decoded Object or an Error in case of failure
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>, URLResponse?) -> Void) {
        
        let task = decodingTask(with: request, decodingType: T.self) { (json, response, error) in
            
            DispatchQueue.main.async {
                
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error), response)
                    } else {
                        completion(Result.failure(.invalidData), response)
                    }
                    return
                }
                
                if let value = decode(json) {
                    completion(.success(value), response)
                } else {
                    completion(.failure(.jsonParsingFailure), response)
                }
            }
        }
        task.resume()
    }
}
