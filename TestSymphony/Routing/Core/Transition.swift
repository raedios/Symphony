//
//  Transition.swift
//  ExchangeRates
//
//  Created by Raed MEZRAOUI on 19-07-08.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

protocol Transition: class {
    var viewController: UIViewController? { get set }
    
    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
