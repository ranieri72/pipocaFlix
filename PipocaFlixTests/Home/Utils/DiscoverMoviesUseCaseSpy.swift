//
//  DiscoverMoviesUseCaseSpy.swift
//  PipocaFlixTests
//
//  Created by Ranieri Aguiar on 27/10/22.
//

@testable import PipocaFlix

final class DiscoverMoviesUseCaseSpy: DiscoverMoviesUseCase {
    
    var getDiscoveredMoviesCallCount = 0
    var successCallCount = 0
    var failureCallCount = 0
    
    var responseType: Result<MoviesResponse, ErrorResponse> = .failure(.invalidResponse)
    
    func getDiscoveredMovies(
        page: String,
        completion: @escaping (Result<MoviesResponse, Error>) -> Void
    ) {
        getDiscoveredMoviesCallCount += 1
        switch responseType {
        case .success(let response):
            successCallCount += 1
            completion(.success(response))
        case .failure(let error):
            failureCallCount += 1
            completion(.failure(error))
        }
    }
}
