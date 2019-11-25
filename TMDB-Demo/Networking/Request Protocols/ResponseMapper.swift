//
//  ResponseMapper.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol ResponseMapper {
    func parseHTTPReponse(_ apiResponse: APIResponse) -> Result<Data, APIError>
}

extension ResponseMapper {
    func parseHTTPReponse(_ apiResponse: APIResponse) -> Result<Data, APIError> {
        guard let response = apiResponse.response, 200...299 ~= response.statusCode else {
            return .failure(.statusCode(apiResponse.response?.statusCode))
        }
        guard let validData = apiResponse.data else { return .failure(.invalidData) }
        return .success(validData)
    }
}
