//
//  MovieCell.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class MovieCell: BaseCell, ReusesableView {

    private let titleLabel = baseLabel("Title", 15).setLine(2)
    private let movieDescription = baseLabel("movie description movie description movie description movie description movie description movie", 10).setLine(0).setLineBreak(.byWordWrapping)
    private let posterImageView = PosterImageView(nil)

    var movie: Movie? {
        didSet {
            configView()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        movieDescription.text = nil
        posterImageView.image = UIImage(named: "imagePlaceHolder")
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
        guard let validMovie = movie else { return }
        titleLabel.text = validMovie.title
        movieDescription.text = validMovie.overview
        if let validPath = validMovie.posterPath {
            posterImageView.fetchImage(url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(validPath)")
        }
    }
    
}
