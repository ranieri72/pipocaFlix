//
//  DiscoverMoviesUseCase.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

protocol DiscoverMoviesUseCase {
    func getDiscoveredMovies(
        page: String,
        completion: @escaping (Result<[Movie], Error>) -> Void
    )
}

final class DiscoverMoviesUseCaseImpl: DiscoverMoviesUseCase {
    private let homeService: HomeService
    
    init(homeService: HomeService) {
        self.homeService = homeService
    }
    
    func getDiscoveredMovies(
        page: String,
        completion: @escaping (Result<[Movie], Error>) -> Void
    ) {
        homeService.getDiscoveredMovies(page: page) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
