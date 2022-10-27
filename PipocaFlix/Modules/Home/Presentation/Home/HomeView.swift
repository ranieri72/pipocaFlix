//
//  HomeView.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

import UIKit

final class HomeView: UIView {
    
    private let moviesTableDataSource = MoviesTableDataSource()
    private let moviesTableDelegate = MoviesTableDelegate()
    
    // MARK: - UI Properties
    lazy var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MoviesTableCell.self, forCellReuseIdentifier: MoviesTableCell.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 170
        tableView.dataSource = moviesTableDataSource
        tableView.delegate = moviesTableDelegate
        return tableView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setup(with viewModel: HomeViewModel) {
        moviesTableDataSource.setup(with: viewModel)
        moviesTableDelegate.setup(with: viewModel)
    }
}

extension HomeView {
    private func buildViewHierarchy() {
        addSubview(moviesTableView)
    }
    
    private func addConstraints() {
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = moviesTableView.topAnchor.constraint(equalTo: topAnchor)
        let trailingConstraint = moviesTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottomConstraint = moviesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let leadingConstraint = moviesTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        addConstraints([topConstraint, trailingConstraint, bottomConstraint, leadingConstraint])
    }
}
