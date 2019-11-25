//
//  MovieViewModel.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol MovieViewModelable {
    var delegate: MovieViewModelDelegate? { get set }
    var searchBarPlaceHolder: String { get }
    var totalMovieCount: Int { get }
    func movieAt(_ index: Int) -> Movie?
    func fetchMovies(searchTerm: String)
}

protocol MovieViewModelDelegate: class {
    func loadingData()
    func viewModelDidFinishLoading()
    func error(title: String, err: TMDBServiceError)
}

class MovieViewModel: MovieViewModelable {

    var totalMovieCount: Int {
        return dataSource.count
    }
    weak var delegate: MovieViewModelDelegate?

    private var dataSource = [Movie]()
    private let tmdbService: TMDBServiceable

    init(service: TMDBServiceable) {
        tmdbService = service
    }

    var searchBarPlaceHolder: String {
        return "Enter Movie Title..."
    }

    func fetchMovies(searchTerm: String) {
        self.delegate?.loadingData()
        tmdbService.fetchMovieInfo(searchTerm) { [weak self] (result) in
            DispatchQueue.main.async {
            switch result {
            case .success(let movies):
                self?.dataSource = movies
            case .failure(let err):
                self?.delegate?.error(title: "Fetching Movie Error", err: err)
            }
                self?.delegate?.viewModelDidFinishLoading()
            }
        }
    }

    func movieAt(_ index: Int) -> Movie? {
        guard index < dataSource.count else { return nil }
        return dataSource[index]
    }
}
