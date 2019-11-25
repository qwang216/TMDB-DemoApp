//
//  TMDBServices.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol TMDBServiceable {
    func fetchMovieInfo(_ term: String, completion: @escaping ((Result<[Movie], TMDBServiceError>) -> Void))
}

class TMDBService: TMDBServiceable {
    func fetchMovieInfo(_ term: String, completion: @escaping ((Result<[Movie], TMDBServiceError>) -> Void)) {
//        guard let encodedTerm = term.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
//            completion(.failure(.encodeSearchTermError(term)))
//            return
//        }

        let movieEndPoint = GetMovieInfo(searchTerm: term)
        movieEndPoint.mapExecuteRequest(objectType: MovieQuery.self) { (result) in
            switch result {
            case .success(let query):
                completion(.success(query.results))
            case .failure(let err):
                completion(.failure(.failedFetchingMovieInfo(err)))
            }
            
        }
    }
}

