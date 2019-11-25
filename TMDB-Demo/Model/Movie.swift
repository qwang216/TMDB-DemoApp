//
//  Movie.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let overview: String
    let posterPath: String?
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
    }
}
