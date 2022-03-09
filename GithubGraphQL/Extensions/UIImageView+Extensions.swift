//
//  UIImageView+Extensions.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 09/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let urlStringWithoutSpace = urlString.replacingOccurrences(of: " ", with: "")
        let url = URL(string: urlStringWithoutSpace)
        self.image = nil
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlStringWithoutSpace as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlStringWithoutSpace as NSString)
                    self.image = image
                }
            }
            
        }).resume()
    }
}
