//
//  Executable.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation
protocol Executable: ResponseMapper {
    var method: HTTPMethod { get }
    var baseURL: String { get }
    var relativePath: String { get }
    var body: JSON? { get }
    var header: HTTPHeader? { get }
    func execute(session: URLSession, completion: @escaping (Result<Data, APIError>) -> Void )
}

extension Executable {

    var relativePath: String {
        return ""
    }

    var baseURL: String {
        return "​https://api.themoviedb.org/3"
    }

    var method: HTTPMethod {
        return .GET
    }

    var body: JSON? {
        return nil
    }

    var header: HTTPHeader? {
        return nil
    }

    var absolutePath: String {
        return baseURL + relativePath
    }

    func execute(session: URLSession = .shared, completion: @escaping (Result<Data, APIError>) -> Void ) {
        guard let url = URL(string: absolutePath) else {
            completion(.failure(.invalidURL(absolutePath)))
            return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header

        if let body = body {
            do {
                let dataBody = try JSONSerialization.data(withJSONObject: body, options: [])
                request.httpBody = dataBody
            }
            catch {
                completion(.failure(.invalidJSONBody(error)))
            }
        }

        session.dataTask(with: request) { (data, response, err) in
            let resultResponse = self.parseHTTPReponse((data, (response as? HTTPURLResponse), err))
            completion(resultResponse)
        }.resume()

    }
}
