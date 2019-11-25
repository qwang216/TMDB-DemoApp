//
//  MovieCell.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class MovieCell: BaseCell, ReusesableView {

    private let titleLabel = baseLabel("Title", 20)
    private let movieDescription = baseLabel("movie description movie description movie description movie description movie description movie", 15).setLine(0).setLineBreak(.byWordWrapping)
    private let posterImageView = placeHolderImageView(nil)

    var movie: Movie? {
        didSet {
            configView()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        movie = nil
    }

    override func setupView() {
        super.setupView()
        setupImageView()
        setupStackViews()
    }

    private func setupImageView() {
        let imageWidth = contentView.bounds.width * 0.35
        let imageHeight = imageWidth * 1.5
        posterImageView.anchorConstrain(size: .init(width: imageWidth, height: imageHeight))
    }

    private func setupStackViews() {
        let vStack = stackView([titleLabel, movieDescription],.vertical, .fill, .fill).setSpacing(4)
        let hStack = stackView([posterImageView, vStack], .horizontal, .center, .fillProportionally).setSpacing(10)

        contentView.addSubview(hStack)
        hStack.anchorConstrain(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }

    private func configView() {
        titleLabel.text = movie?.title
        movieDescription.text = movie?.overview
    }
    
}
