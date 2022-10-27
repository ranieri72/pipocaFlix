//
//  MoviesCollectionDelegate.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class MoviesCollectionDelegate: NSObject {
    
    private var movies: [Movie]?
    private var viewModel: HomeViewModel?
    
    func setup(with movies: [Movie], viewModel: HomeViewModel) {
        self.movies = movies
        self.viewModel = viewModel
    }
}

extension MoviesCollectionDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = movies?[indexPath.row] else { return }
        viewModel?.openDetail(with: movie)
    }
}
