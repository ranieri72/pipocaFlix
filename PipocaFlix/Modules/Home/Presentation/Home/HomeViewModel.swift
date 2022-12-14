//
//  HomeViewModel.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

protocol HomeViewModel {
    var controller: HomeDisplayLogic? { get set }
    func getMovies(from section: Int) -> [Movie]
    func numberOfMovieSections() -> Int
    func discoverMovies(from section: Int)
    func openDetail(with movie: Movie)
}

final class HomeViewModelImpl {
    
    // MARK: - Properties
    private let discoverMoviesUseCase: DiscoverMoviesUseCase
    weak var controller: HomeDisplayLogic?
    
    var moviesSections = [Int: [Movie]]()
    
    // MARK: - Initializers
    init(discoverMoviesUseCase: DiscoverMoviesUseCase) {
        self.discoverMoviesUseCase = discoverMoviesUseCase
    }
    
    func fetchMovies(from page: Int) {
        discoverMoviesUseCase.getDiscoveredMovies(page: String(page)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.handleSuccessData(movies: response)
            case .failure(let error):
                self.controller?.displayAlert(with: "alertTitle".localized(), message: error.localizedDescription)
            }
        }
    }
    
    // MARK: - Handlers
    private func handleSuccessData(movies: MoviesResponse) {
        moviesSections[movies.page] = movies.results
        controller?.showMovies(from: movies.page)
    }
}

extension HomeViewModelImpl: HomeViewModel {
    func getMovies(from section: Int) -> [Movie] {
        return moviesSections[section] ?? [Movie]()
    }
    
    func numberOfMovieSections() -> Int {
        let highestSection = moviesSections.max { $0.key < $1.key }
        return highestSection?.key ?? 0
    }
    
    func discoverMovies(from section: Int) {
        if moviesSections[section] == nil {
            fetchMovies(from: section)
        }
    }
    
    func openDetail(with movie: Movie) {
        if movie.isBelowAverage() {
            controller?.displayAlert(with: "alertTitle".localized(), message: "alertMessage".localized())
        } else {
            controller?.presentDetail(with: movie)
        }
    }
}
