//
//  UIImageView+Extensions.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

/// Will cache image if image url is successful otherwise set to a default image
protocol CacheableImageView: class {
    var imageURL: String? { get set }
}

let imageCache = NSCache<NSString, UIImage>()
extension CacheableImageView where Self: UIImageView {
    func fetchImage(url: String) {
        let nsURLString = url as NSString
        imageURL = url
        image = UIImage(named: "imagePlaceHolder")

        if let cachedImage = imageCache.object(forKey: nsURLString) {
            self.image = cachedImage
            return
        }
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let validData = data, let validImage = UIImage(data: validData) else {
                return
            }
            DispatchQueue.main.async {
                self.image = validImage
            }
        }.resume()
    }
}
