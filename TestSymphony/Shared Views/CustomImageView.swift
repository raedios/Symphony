//
//  CustomImageView.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-16.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsing(urlString: String, completion: (()->())?) {
        
        guard let url = URL(string: urlString) else {
            completion?()
            return
        }
        
        imageUrlString = urlString
        image = nil
        
        // Check if the image already cached
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            
            self.image = imageFromCache
            completion?()
            return
        }
        
        // Load the image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            DispatchQueue.main.async {
                
                if error != nil {
                    
                    print("Error loading image!")
                    self.image = UIImage(named: "imageNotAvailable")
                    completion?()
                    return
                }
                
                // Cache the laoded image and cache it using its url as the key
                let imageToCache = UIImage(data: data!)
                
                // Check if the finished image is the same who started loading
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                completion?()
            }
        }).resume()
    }
}
