//
//  Style.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

// MARK: - Labels

let baseLabel: (String, CGFloat) -> UILabel = { text, fontSize in
    let lb = UILabel()
    lb.text = text
    lb.font = UIFont.systemFont(ofSize: fontSize)
    return lb
}

extension UILabel {
    @discardableResult
    func setLine(_ number: Int) -> UILabel {
        self.numberOfLines = number
        return self
    }
    
    @discardableResult
    func setLineBreak(_ mode: NSLineBreakMode) -> UILabel {
        self.lineBreakMode = mode
        return self
    }
}

// MARK: - StackView

let stackView: ([UIView], NSLayoutConstraint.Axis, UIStackView.Alignment, UIStackView.Distribution) -> UIStackView = { views, axis, alignment, distripution in
    let stv = UIStackView(arrangedSubviews: views)
    stv.axis = axis
    stv.alignment = alignment
    stv.distribution = distripution
    return stv
}

extension UIStackView {
    @discardableResult
    func setSpacing(_ spacing: CGFloat) -> UIStackView {
        self.spacing = spacing
        return self
    }
}

// MARK: - ImageView

let placeHolderImageView: (UIImage?) -> UIImageView = { image in
    let validImage = image ?? UIImage(named: "imagePlaceHolder")
    let iv = UIImageView(image: validImage)
    iv.contentMode = .scaleAspectFit
    return iv
}
