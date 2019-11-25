//
//  DecodableObject.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol DecodableObject {
    static func decode<T: Decodable>(_ object: T.Type ,from data: Data) -> (Result<T, APIError>)
}

extension DecodableObject {
    static func decode<T: Decodable>(_ object: T.Type ,from data: Data) -> (Result<T, APIError>) {
        do {
            let object = try JSONDecoder().decode(object, from: data)
            return .success(object)
        } catch {
            return .failure(.decode(error))
        }
    }
}
