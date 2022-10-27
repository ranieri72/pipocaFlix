//
//  MoviesTableCell.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class MoviesTableCell: UITableViewCell {
    
    static let cellIdentifier = "moviesTableCell"
    
    private let moviesCollectionDataSource = MoviesCollectionDataSource()
    private let moviesCollectionDelegate = MoviesCollectionDelegate()
    
    // MARK: - UI Properties
    private lazy var moviesColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: layout)
        collectionView.register(MoviesCollectionCell.self, forCellWithReuseIdentifier: MoviesCollectionCell.cellIdentifier)
        collectionView.dataSource = moviesCollectionDataSource
        collectionView.delegate = moviesCollectionDelegate
        return collectionView
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setupData(with movies: [Movie], viewModel: HomeViewModel) {
        moviesCollectionDataSource.setup(movies: movies)
        moviesCollectionDelegate.setup(with: movies, viewModel: viewModel)
        moviesColletionView.reloadData()
    }
}

extension MoviesTableCell {
    private func buildViewHierarchy() {
        addSubview(moviesColletionView)
    }
    
    private func addConstraints() {
        moviesColletionView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = moviesColletionView.topAnchor.constraint(equalTo: topAnchor)
        let trailingConstraint = moviesColletionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottomConstraint = moviesColletionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let leadingConstraint = moviesColletionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        addConstraints([topConstraint, trailingConstraint, bottomConstraint, leadingConstraint])
    }
}
