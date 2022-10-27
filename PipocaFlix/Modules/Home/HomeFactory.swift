//
//  DIContainer.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

final class HomeFactory {
    
    // MARK: - Controllers
    func makeHomeController(delegate: HomeControllerDelegate) -> HomeController {
        let controller = HomeController()
        var viewModel = makeHomeViewModel()
        viewModel.controller = controller
        controller.create(with: viewModel)
        controller.delegate = delegate
        return controller
    }
    
    func makeDetailController(with movie: Movie) -> DetailController {
        let controller = DetailController()
        controller.create(with: movie)
        return controller
    }
    
    // MARK: - ViewModels
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModelImpl(discoverMoviesUseCase: makeDiscoverMoviesUseCase())
    }
    
    // MARK: - Use Cases
    func makeDiscoverMoviesUseCase() -> DiscoverMoviesUseCase {
        return DiscoverMoviesUseCaseImpl(homeService: makeHomeService())
    }
    
    // MARK: - Service
    func makeHomeService() -> HomeService {
        let network = DefaultNetworkService()
        return HomeServiceImpl(networkService: network)
    }
}
