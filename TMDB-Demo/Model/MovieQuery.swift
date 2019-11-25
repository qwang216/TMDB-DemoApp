//
//  MovieQuery.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

struct MovieQuery: Decodable {
    let results: [Movie]
}

