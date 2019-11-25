//
//  TMDBServiceError.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

enum TMDBServiceError {
    case failedFetchingMovieInfo(Error)
    case encodeSearchTermError(String)
}

extension TMDBServiceError: Error {
    var localizedDescription: String {
        switch self {
        case .failedFetchingMovieInfo(let err):
            print(err.localizedDescription)
            return "Oh no unable to fetch movie info at this moment please try again later"
        case .encodeSearchTermError(let term):
            print("failed at encoding search term: \(term)")
            return "Oh no something went wrong please try a different search term"
        }
    }
}
