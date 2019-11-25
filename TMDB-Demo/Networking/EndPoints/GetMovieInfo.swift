//
//  GetMovieInfo.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

struct GetMovieInfo: Executable, DecodableObject, DecodableMapper {
    var relativePath: String = "/3/search/movie"
    var queryItems: [URLQueryItem]? = [URLQueryItem]()

    init(searchTerm: String) {
        queryItems?.append(URLQueryItem(name: "api_key", value: "2a61185ef6a27f400fd92820ad9e8537"))
        queryItems?.append(URLQueryItem(name: "query", value: searchTerm))
    }
}
