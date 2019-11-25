//
//  APIError.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

enum APIError {
    case invalidJSONBody(Error)
    case jsonSerialization(Error)
    case jsonCasting
    case statusCode(Int?)
    case invalidData
    case decode(Error)
    case invalidURL(String)
}

extension APIError: Error {
    var localizedDescription: String {
        switch self {
        case .invalidJSONBody(let err):
            return "Developer: Invalid JSON Body \(err.localizedDescription)"
        case .jsonSerialization(let err):
            return "Failed to Serialize JSON \(err.localizedDescription)"
        case .jsonCasting:
            return "Error on JSON Casting"
        case .statusCode(let code):
            return "Something went Wrong StatusCode: \(code ?? -1)"
        case .invalidData:
            return "Invalid Data"
        case .decode(let err):
            return "Unable to decode Object: \(err.localizedDescription)"
        case .invalidURL(let url):
            return "Invalid URL: \(url)"
        }
    }
}
