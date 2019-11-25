//
//  Style.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

let baseLabel: (String, CGFloat) -> UILabel = { text, fontSize in
    let lb = UILabel()
    lb.text = text
    lb.font = UIFont.systemFont(ofSize: fontSize)
    return lb
}

let stackView: ([UIView], NSLayoutConstraint.Axis, UIStackView.Alignment, UIStackView.Distribution) -> UIStackView = { views, axis, alignment, distripution in
    let stv = UIStackView(arrangedSubviews: views)
    stv.axis = axis
    stv.alignment = alignment
    stv.distribution = distripution
    return stv
}

func setSpacingOn(_ stackView: UIStackView, spacing: CGFloat){
    stackView.spacing = spacing
}
