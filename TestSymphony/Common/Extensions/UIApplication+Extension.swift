//
//  UIApplication+Extension.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

extension UIApplication {
    
    func setRoot() {
        
        // Set root ViewController
        let rootViewController = AuthorsRoute().viewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = navigationController
        appDelegate?.window??.makeKeyAndVisible()
    }
}
