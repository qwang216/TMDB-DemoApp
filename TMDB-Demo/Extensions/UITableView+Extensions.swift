//
//  UITableView+Extensions.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ cell: T.Type) where T: ReusesableView {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func dequeueCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: ReusesableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue Cell with ID: \(T.identifier)")
        }
        return cell
    }

}
