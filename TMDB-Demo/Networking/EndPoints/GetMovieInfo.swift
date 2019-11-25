//
//  GetMovieInfo.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

struct GetMovieInfo: Executable, DecodableObject, DecodableMapper {
    var relativePath: String

    init(token: TMDBToken, encodedSearchTerm: String) {
        relativePath = "/search/movie?"
        relativePath += "query=\(encodedSearchTerm)"
        relativePath += "&\(token.key)=\(token.value)"
    }
}
