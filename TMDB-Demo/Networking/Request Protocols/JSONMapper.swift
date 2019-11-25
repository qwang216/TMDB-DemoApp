//
//  JSONMapper.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol APIJSONMapper {
    static func serializeJSON(_ data: Data) -> Result<JSON, APIError>
    func mapExecuteRequest(force: Bool, onCompletion: @escaping (Result<JSON, APIError>) -> Void)
}

extension APIJSONMapper where Self: Executable {

    func mapExecuteRequest(force: Bool = false, onCompletion: @escaping (Result<JSON, APIError>) -> Void) {
        execute { (result) in
            switch result {
            case .success(let data):
                onCompletion(Self.serializeJSON(data))
            case .failure(let err):
                onCompletion(.failure(err))
            }
        }
    }

    static func serializeJSON(_ data: Data) -> Result<JSON, APIError> {
        do {
            guard let dataObject = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {
                return . failure(.jsonCasting)
            }
            return .success(dataObject)
        } catch {
            return .failure(.jsonSerialization(error))
        }
    }

}
