//
//  DataType.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

public typealias HTTPHeader = [String: String]
public typealias JSON = [String: Any]
public typealias JSONStr = [String: String]
public typealias APIResponse = (data: Data?, response: HTTPURLResponse?, error: Error?)
