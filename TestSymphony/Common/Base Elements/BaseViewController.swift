//
//  BaseViewController.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-21.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    /// Show native alert
    ///
    /// - Parameters:
    ///   - title: Title
    ///   - message: Message
    ///   - defaultAction: Default action title
    func showAlert(title: String,
                         message: String,
                         defaultAction: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: defaultAction, style: .default))
        present(alert, animated: true)
    }
}
