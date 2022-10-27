//
//  MoviesTableDataSource.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class MoviesTableDataSource: NSObject {
    
    private var viewModel: HomeViewModel?
    
    // MARK: - Setup
    func setup(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

extension MoviesTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfMovieSections() ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: MoviesTableCell.cellIdentifier, for: indexPath)
        guard let moviesTableCell = tableViewCell as? MoviesTableCell,
              let movies = viewModel?.getMovies(from: indexPath.row + 1),
              let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        moviesTableCell.setupData(with: movies, viewModel: viewModel)
        return moviesTableCell
    }
}
