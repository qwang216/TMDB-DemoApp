//
//  MovieCell.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class MovieCell: BaseCell, ReusesableView {

    let titleLabel = baseLabel("Title", 20)
    let movieDescription = baseLabel("movie description", 15)

    override func setupView() {
        super.setupView()
        let vStack = stackView([titleLabel, movieDescription],.vertical, .fill, .fill)
        setSpacingOn(vStack, spacing: 4)
        contentView.addSubview(vStack)
        vStack.fillToSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
