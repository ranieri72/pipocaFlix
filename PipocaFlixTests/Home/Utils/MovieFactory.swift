//
//  MovieFactory.swift
//  PipocaFlixTests
//
//  Created by Ranieri Aguiar on 27/10/22.
//

@testable import PipocaFlix
import Foundation

final class MovieFactory {
    
    static let jsonReponse = """
    {
        "page": 1,
        "results": [
            {
                "poster_path": "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
                "vote_average": 7.1
            },
            {
                "poster_path": "/aGBuiirBIQ7o64FmJxO53eYDuro.jpg",
                "vote_average": 5.8
            }
        ]
    }
    """
    
    static func generateMoviesMock() -> MoviesResponse? {
        let data = jsonReponse.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(MoviesResponse.self, from: data)
    }
}
