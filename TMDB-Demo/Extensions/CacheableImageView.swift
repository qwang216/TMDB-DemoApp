//
//  UIImageView+Extensions.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

protocol CacheableImageView: class {
    var imageURL: String? { get set }
    var isLoading: Bool { get set }
}

let imageCache = NSCache<NSString, UIImage>()
extension CacheableImageView where Self: UIImageView {
    func fetchImage(url: String) {
        isLoading = true
        let nsURLString = url as NSString
        imageURL = url
        image = nil

        if let cachedImage = imageCache.object(forKey: nsURLString) {
            isLoading = false
            self.image = cachedImage
            return
        }
        let fetcher = GetMoviePosterImage(url: url)
        fetcher.execute { [weak self] (result) in
            self?.isLoading = false
            switch result {
            case .success(let data):
                guard self?.imageURL == url, let validImage = UIImage(data: data) else { return }
                imageCache.setObject(validImage, forKey: nsURLString)
                self?.image = validImage
            case .failure(let err):
                print("loading Image error: \(err.localizedDescription)")
                self?.image = UIImage(named: "imagePlaceHolder")
            }
        }
    }
}
