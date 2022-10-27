//
//  DetailView.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

final class DetailView: UIView {
    
    // MARK: - UI Properties
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViewHierarchy()
        addConstraints()
        configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setupData(with movie: Movie) {
        posterImage.download(path: movie.posterPath)
        voteAverageLabel.text = String(format: "detailAverageVote".localized(), String(movie.voteAverage))
    }
}

extension DetailView {
    private func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(posterImage)
        containerView.addSubview(voteAverageLabel)
    }
    
    private func addConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            posterImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            posterImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            posterImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            posterImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8)
        ])
        
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            voteAverageLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor),
            voteAverageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            voteAverageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            voteAverageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    private func configViews() {
        backgroundColor = .black.withAlphaComponent(0.7)
    }
}
