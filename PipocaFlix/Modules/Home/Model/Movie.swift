//
//  Movie.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 25/10/22.
//

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
}

struct Movie: Decodable {
    
    let posterPath: String
    let voteAverage: Float
    
    func isBelowAverage() -> Bool {
        return voteAverage < 6
    }
}
