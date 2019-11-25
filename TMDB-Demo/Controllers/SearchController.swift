//
//  ViewController.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class MovieSearchController: UIViewController {

    private let tableView = UITableView()
    private var searchController: UISearchController? {
        didSet {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    private let activity = activityIndicator()

    var viewModel: MovieViewModelable?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieViewModel(service: TMDBService())
        viewModel?.delegate = self
        view.addSubviews(tableView)
        setupSearchController()
        setupTableView()
        setupActivityIndicator()
    }

    private func setupSearchController() {
        searchController = UISearchController()
        searchController?.searchBar.placeholder = viewModel?.searchBarPlaceHolder
        searchController?.searchBar.delegate = self
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.fillToSuperview()
        tableView.register(MovieCell.self)
    }

    private func setupActivityIndicator () {
        view.addSubview(activity)
        activity.hidesWhenStopped = true
        activity.centerSuperView()
    }

}

extension MovieSearchController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.totalMovieCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath: indexPath) as MovieCell
        cell.movie = viewModel?.movieAt(indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension MovieSearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        viewModel?.fetchMovies(searchTerm: searchTerm)
    }
}

extension MovieSearchController: MovieViewModelDelegate {
    func loadingData() {
        activity.startAnimating()
    }

    func viewModelDidFinishLoading() {
        activity.stopAnimating()
        tableView.reloadData()
    }

    func error(title: String, err: TMDBServiceError) {
        showAlert(title: title, err)
    }

}
