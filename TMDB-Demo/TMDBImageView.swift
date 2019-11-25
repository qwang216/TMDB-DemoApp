//
//  TMDBImageView.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class TMDBImageView: UIImageView, CacheableImageView {
    var imageURL: String?

    var isLoading: Bool = false {
        didSet {
            setViewState()
        }
    }

    func setViewState() {

    }
}
