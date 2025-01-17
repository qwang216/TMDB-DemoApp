//
//  UIView+Anchor.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class Anchor {
    var width: NSLayoutConstraint?
    var height: NSLayoutConstraint?
    var leading: NSLayoutConstraint?
    var top: NSLayoutConstraint?
    var trailing: NSLayoutConstraint?
    var bottom: NSLayoutConstraint?
    var centerX: NSLayoutConstraint?
    var centerY: NSLayoutConstraint?
}

extension UIView {

    /// Helper function to add multiple views in one line
    /// - Parameter views: list of views
    func addSubviews(_ views: UIView...) {
        views.forEach{ addSubview($0) }
    }

    @discardableResult
    func centerSuperView(offSetX: CGFloat = 0, offSetY: CGFloat = 0) -> Anchor {
        let currAnchor = Anchor()
        guard let validSuperView = superview else { return currAnchor }
        translatesAutoresizingMaskIntoConstraints = false
        let centerX = centerXAnchor.constraint(equalTo: validSuperView.centerXAnchor, constant: offSetX)
        centerX.isActive = true
        currAnchor.centerX = centerX

        let centerY = centerYAnchor.constraint(equalTo: validSuperView.centerYAnchor, constant: offSetY)
        centerY.isActive = true
        currAnchor.centerY = centerY

        return currAnchor
    }

    /// Helper function to center X superview
    /// - Parameter offSetY: default value is 0
    @discardableResult
    func centerYSuperView(offSetY: CGFloat = 0) -> Anchor {
        guard let currSuperView = superview else { return Anchor() }
        let currentAnchor = Anchor()
        translatesAutoresizingMaskIntoConstraints = false

        let centerY = centerYAnchor.constraint(equalTo: currSuperView.centerYAnchor, constant: offSetY)
        centerY.isActive = true
        currentAnchor.centerY = centerY
        return currentAnchor
    }

    /// Helper function set the constrain to fill up super view
    /// - Parameter padding: default value .zero
    @discardableResult
    func fillToSuperview(padding: UIEdgeInsets = .zero) -> Anchor {

        translatesAutoresizingMaskIntoConstraints = false
        return anchorConstrain(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: padding)
    }

    /// Helper function to add constrains for top, leading, bottom, trailing, padding, and size
    /// - Parameters:
    ///   - top: top anchor
    ///   - leading: leading anchor
    ///   - bottom: bottom anchor
    ///   - trailing: trailing anchor
    ///   - padding: padding is for spacing between top, leading, bottom, and trailing. Default is .zero
    ///   - size: set size of the view. Default is .zero
    @discardableResult
    func anchorConstrain(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> Anchor {

        translatesAutoresizingMaskIntoConstraints = false
        let anchor = Anchor()
        if let top = top {
            let topConstrain = topAnchor.constraint(equalTo: top, constant: padding.top)
            topConstrain.isActive = true
            anchor.top = topConstrain
        }
        if let leading = leading {
            let leadingConstrain = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            leadingConstrain.isActive = true
            anchor.leading = leadingConstrain
        }
        if let bottom = bottom {
            let bottomConstrain = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
            bottomConstrain.isActive = true
            anchor.bottom = bottomConstrain
        }
        if let trailing = trailing {
            let trailingConstrain = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
            trailingConstrain.isActive = true
            anchor.trailing = trailingConstrain
        }
        if size.width != 0 {
            let widthConstrain = widthAnchor.constraint(equalToConstant: size.width)
            widthConstrain.isActive = true
            anchor.width = widthConstrain
        }
        if size.height != 0 {
            let heightConstrain = heightAnchor.constraint(equalToConstant: size.height)
            heightConstrain.isActive = true
            anchor.height = heightConstrain
        }
        return anchor
    }
}
