//
//  Style.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

// MARK: - Labels

/// input parameter of (text, font size)
let baseLabel: (String, CGFloat) -> UILabel = { text, fontSize in
    let lb = UILabel()
    lb.text = text
    lb.font = UIFont.systemFont(ofSize: fontSize)
    return lb
}

extension UILabel {
    /// Set number of Lines for UILabel
    /// - Parameter number: number of lines the label should have
    @discardableResult
    func setLine(_ number: Int) -> UILabel {
        self.numberOfLines = number
        return self
    }

    /// Line Breaks
    /// - Parameter mode: set mode for line breaks
    @discardableResult
    func setLineBreak(_ mode: NSLineBreakMode) -> UILabel {
        self.lineBreakMode = mode
        return self
    }
}

// MARK: - StackView

/// reuseable closer to construct StackView ([UIView], Axis, Alignment, Distribution)
let stackView: ([UIView], NSLayoutConstraint.Axis, UIStackView.Alignment, UIStackView.Distribution) -> UIStackView = { views, axis, alignment, distripution in
    let stv = UIStackView(arrangedSubviews: views)
    stv.axis = axis
    stv.alignment = alignment
    stv.distribution = distripution
    return stv
}

extension UIStackView {
    /// Set Spacing between each view
    /// - Parameter spacing: space between each view in stackview
    @discardableResult
    func setSpacing(_ spacing: CGFloat) -> UIStackView {
        self.spacing = spacing
        return self
    }
}

// MARK: - ImageView

/// reuseable closure for imageview. By default has a image place holder
let placeHolderImageView: (UIImage?) -> UIImageView = { image in
    let validImage = image ?? UIImage(named: "imagePlaceHolder")
    let iv = UIImageView(image: validImage)
    iv.contentMode = .scaleAspectFit
    return iv
}
