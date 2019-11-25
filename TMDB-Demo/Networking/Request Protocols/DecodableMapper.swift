//
//  DecodableMapper.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol DecodableMapper {
    func mapExecuteRequest<T: Decodable>(objectType: T.Type, onCompletion: @escaping (Result<T, APIError>) -> Void)
}

extension DecodableMapper where Self: Executable,
                                Self: DecodableObject {

    func mapExecuteRequest<T: Decodable>(objectType: T.Type, onCompletion: @escaping (Result<T, APIError>) -> Void) {
        execute { (result) in
            switch result {
            case .success(let data):
                onCompletion(Self.decode(objectType, from: data))
            case .failure(let err):
                onCompletion(.failure(err))
            }
        }
    }

}
