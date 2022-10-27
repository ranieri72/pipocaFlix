//
//  HomeCoordinator.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

protocol HomeControllerDelegate: AnyObject {
    func openDetail(with movie: Movie)
}

public final class HomeCoordinator {
    
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let controller = HomeFactory().makeHomeController(delegate: self)
        navigationController.viewControllers = [controller]
        return navigationController
    }
}

extension HomeCoordinator: HomeControllerDelegate {
    func openDetail(with movie: Movie) {
        let controller = HomeFactory().makeDetailController(with: movie)
        navigationController.present(controller, animated: true)
    }
}
