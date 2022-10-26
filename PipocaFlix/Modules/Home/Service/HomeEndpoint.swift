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
    typealias Response = [Movie]
    
    var url: String {
        switch self {
        case .getDiscoveredMovies:
            let baseURL: String = "https://api.themoviedb.org/3"
            let path: String = "/discover/movie"
            return baseURL + path
        }
    }
    
    var queryItems: [String : String] {
        switch self {
        case .getDiscoveredMovies(let page):
            let apiKey: String = "9c3708bebb618b057ff852cd4ee7ae0e"
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
    
    func decode(_ data: Data) throws -> [Movie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(MoviesResponse.self, from: data)
        return response.results
    }
}
