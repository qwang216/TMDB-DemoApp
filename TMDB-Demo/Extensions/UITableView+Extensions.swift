//
//  UITableView+Extensions.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

extension UITableView {

    /// Generic register function that can take in any UITableviewCell subclass that conforms to ReuseableView protocol
    /// - Parameter cell: Any subclass of UITableView
    func register<T: UITableViewCell>(_ cell: T.Type) where T: ReusesableView {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    /// Generic Dequeue Cell function that takes in any UITableViewCell subclass that conforms to ReuseableView protocol. Will crash if identifier does not match
    /// - Parameter indexPath: IndexPath
    func dequeueCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: ReusesableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue Cell with ID: \(T.identifier)")
        }
        return cell
    }

}
