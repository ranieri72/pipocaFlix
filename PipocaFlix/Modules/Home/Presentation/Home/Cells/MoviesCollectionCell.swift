//
//  MoviesCollectionCell.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class MoviesCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier = "moviesCollectionCell"
    
    // MARK: - UI Properties
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        addConstraints()
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setupData(with movie: Movie) {
        posterImage.download(path: movie.posterPath)
    }
}

extension MoviesCollectionCell {
    private func buildViewHierarchy() {
        addSubview(posterImage)
    }
    
    private func addConstraints() {
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = posterImage.topAnchor.constraint(equalTo: topAnchor)
        let trailingConstraint = posterImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottomConstraint = posterImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        let leadingConstraint = posterImage.leadingAnchor.constraint(equalTo: leadingAnchor)
        addConstraints([topConstraint, trailingConstraint, bottomConstraint, leadingConstraint])
    }
}
