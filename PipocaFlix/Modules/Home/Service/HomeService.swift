//
//  HomeService.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

protocol HomeService {
    func getDiscoveredMovies(
        page: String,
        completion: @escaping (Result<[Movie], Error>) -> Void
    )
}

final class HomeServiceImpl: HomeService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getDiscoveredMovies(
        page: String,
        completion: @escaping (Result<[Movie], Error>) -> Void
    ) {
        networkService.request(
            request: HomeEndpoint.getDiscoveredMovies(page: page),
            completion: completion
        )
    }
}
