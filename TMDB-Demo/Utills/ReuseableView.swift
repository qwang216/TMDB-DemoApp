//
//  ReuseableView.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

/// Any View conforms to ReuseableView will have an identifier as it's class name
protocol ReusesableView { }
extension ReusesableView where Self: Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

