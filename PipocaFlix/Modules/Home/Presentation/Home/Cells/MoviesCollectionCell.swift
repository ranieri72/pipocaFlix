//
//  MoviesCollectionCell.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class MoviesCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier = "moviesCollectionCell"
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setupData(with movie: Movie) {
        backgroundColor = .darkGray
    }
}
