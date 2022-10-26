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
    
    init(posterPath: String = "", voteAverage: Float = 0.0) {
        self.posterPath = posterPath
        self.voteAverage = voteAverage
    }
    
    let posterPath: String
    let voteAverage: Float
}
