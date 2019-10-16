//
//  ViewController.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        AuthorsServices().fetchAuthors(atPage: "6") { result in
            
            switch result {
            case .success(let authors):
                print("ok")
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
