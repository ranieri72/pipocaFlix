//
//  HomeController.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func showMovies(from movieSection: Int)
    func displayAlert(with title: String, message: String)
    func presentDetail(with movie: Movie)
}

final class HomeController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: HomeViewModel?
    private let mainView = HomeView()
    var delegate: HomeControllerDelegate?
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.discoverMovies(from: 1)
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    // MARK: - Create
    func create(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Setup
    private func setup() {
        guard let viewModel = viewModel else { return }
        mainView.setup(with: viewModel)
    }
}

extension HomeController: HomeDisplayLogic {
    func showMovies(from movieSection: Int) {
        DispatchQueue.main.async {
            self.mainView.moviesTableView.reloadData()
        }
    }
    
    func displayAlert(with title: String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        dialogMessage.addAction(UIAlertAction(title: "alertOk".localized(), style: .default))
        present(dialogMessage, animated: true, completion: nil)
    }
    
    func presentDetail(with movie: Movie) {
        delegate?.openDetail(with: movie)
    }
}
