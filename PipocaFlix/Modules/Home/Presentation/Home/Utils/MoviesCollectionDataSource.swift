//
//  MoviesCollectionDataSource.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class MoviesCollectionDataSource: NSObject {
    
    private var movies: [Movie]?
    
    // MARK: - Setup
    func setup(movies: [Movie]) {
        self.movies = movies
    }
}

extension MoviesCollectionDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionCell.cellIdentifier, for: indexPath)
        guard let moviesCollectionCell = collectionViewCell as? MoviesCollectionCell,
              let movie = movies?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        moviesCollectionCell.setupData(with: movie)
        return moviesCollectionCell
    }
}
