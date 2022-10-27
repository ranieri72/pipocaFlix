//
//  HomeDisplayLogicSpy.swift
//  PipocaFlixTests
//
//  Created by Ranieri Aguiar on 27/10/22.
//

@testable import PipocaFlix

final class HomeDisplayLogicSpy: HomeDisplayLogic {
    
    var showMoviesCallCount = 0
    var displayAlertCallCount = 0
    var presentDetailCallCount = 0
    
    func showMovies(from movieSection: Int) {
        showMoviesCallCount += 1
    }
    
    func displayAlert(with title: String, message: String) {
        displayAlertCallCount += 1
    }
    
    func presentDetail(with movie: PipocaFlix.Movie) {
        presentDetailCallCount += 1
    }
}
