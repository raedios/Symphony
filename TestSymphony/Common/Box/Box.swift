//
//  Box.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

/// Binding class
class Box<T> {
    
    // MARK: - Properties
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // MARK: - Init
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: - Methods
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
