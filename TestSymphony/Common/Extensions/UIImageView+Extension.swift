//
//  UIImageView+Extension.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-17.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func makeRounded() {
        
        self.layer.borderWidth = 3
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
