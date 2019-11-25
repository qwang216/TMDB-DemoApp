//
//  ViewController.swift
//  TMDB-Demo
//
//  Created by Jason wang on 11/25/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

protocol MovieViewModelable {
    var searchBarPlaceHolder: String { get }
    var movieCounts: Int { get }

}

class MovieViewModel: MovieViewModelable {
    var movieCounts: Int {
        return 5
    }
    var dataSource = [Int]()
    var searchBarPlaceHolder: String {
        return "Enter Movie Title..."
    }

}

class MovieSearchController: UIViewController {

    private let tableView = UITableView()
    private var searchController: UISearchController? {
        didSet {
            navigationItem.searchController = searchController
        }
    }

    var viewModel: MovieViewModelable?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieViewModel()
        view.addSubviews(tableView)
        setupSearchController()
        setupTableView()
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

}

extension MovieSearchController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movieCounts ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath: indexPath) as MovieCell
        return cell
    }

}

extension MovieSearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        print(searchTerm)
    }
}
