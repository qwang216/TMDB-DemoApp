//
//  Executable.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation
protocol Executable: ResponseMapper {
    var relativePath: String { set get }
    var queryItems: [URLQueryItem]? { get }
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var body: JSON? { get }
    var header: HTTPHeader? { get }
    func execute(session: URLSession, completion: @escaping (Result<Data, APIError>) -> Void )
}

extension Executable {

    var relativePath: String {
        return ""
    }

    var queryItems: [URLQueryItem]? {
        return nil
    }

    var baseURL: String {
        return "​api.themoviedb.org"
    }

    var scheme: String {
        return "https"
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

    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseURL
        urlComponents.path = relativePath
        if let items = queryItems {
            urlComponents.queryItems = items
        }
        return urlComponents.url
    }

    func execute(session: URLSession = .shared, completion: @escaping (Result<Data, APIError>) -> Void ) {
//        let urlpath = "https://api.themoviedb.org/3/search/movie?api_key=2a61185ef6a27f400fd92820ad9e8537&query=Harry%20Potter"
        guard let validURL = url else {
            completion(.failure(.invalidURL("\(url?.absoluteString ?? "inavlid url")")))
            return }
        var request = URLRequest(url: validURL)
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
