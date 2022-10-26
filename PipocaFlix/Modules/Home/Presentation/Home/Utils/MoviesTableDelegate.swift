//
//  MoviesTableDelegate.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class MoviesTableDelegate: NSObject {
    
    private var viewModel: HomeViewModel?
    
    // MARK: - Setup
    func setup(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

extension MoviesTableDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel?.discoverMovies(from: indexPath.row + 2)
    }
}
