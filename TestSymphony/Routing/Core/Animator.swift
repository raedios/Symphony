//
//  Animator.swift
//  ExchangeRates
//
//  Created by Raed MEZRAOUI on 19-07-08.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
