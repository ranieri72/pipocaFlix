//
//  HomeEndpoint.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

import Foundation

enum HomeEndpoint {
    case getDiscoveredMovies(page: String)
}

extension HomeEndpoint: Endpoint {
    typealias Response = MoviesResponse
    
    var url: String {
        switch self {
        case .getDiscoveredMovies:
            let baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
            let path: String = "/discover/movie"
            return baseURL + path
        }
    }
    
    var queryItems: [String : String] {
        switch self {
        case .getDiscoveredMovies(let page):
            let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String ?? ""
            return [
                "api_key": apiKey,
                "page": page
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getDiscoveredMovies:
            return .get
        }
    }
    
    func decode(_ data: Data) throws -> MoviesResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(MoviesResponse.self, from: data)
        return response
    }
}
