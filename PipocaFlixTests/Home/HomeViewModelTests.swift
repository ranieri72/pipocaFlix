//
//  HomeViewModelTests.swift
//  PipocaFlixTests
//
//  Created by Ranieri Aguiar on 27/10/22.
//

import XCTest
@testable import PipocaFlix

final class HomeViewModelTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: HomeViewModelImpl!
    var spyViewController: HomeDisplayLogicSpy!
    var spyUseCase: DiscoverMoviesUseCaseSpy!
    
    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        spyUseCase = DiscoverMoviesUseCaseSpy()
        spyViewController = HomeDisplayLogicSpy()
        sut = HomeViewModelImpl(discoverMoviesUseCase: spyUseCase)
        sut.controller = spyViewController
    }
    
    override func tearDown() {
        super.tearDown()
        spyUseCase = nil
        spyViewController = nil
        sut = nil
    }
    
    // MARK: - Tests
    func test_getMovies_withExistingFilms() {
        // Given
        let expectedMovies = MovieFactory.generateMoviesMock()!.results
        sut.moviesSections = [1: expectedMovies]
        
        // When
        let receivedMovies = sut.getMovies(from: 1)
        
        // Then
        XCTAssertEqual(expectedMovies, receivedMovies)
    }
    
    func test_getMovies_withNonExistingFilms() {
        // Given
        let expectedMovies = MovieFactory.generateMoviesMock()!.results
        sut.moviesSections = [1: expectedMovies]
        
        // When
        let receivedMovies = sut.getMovies(from: 2)
        
        // Then
        XCTAssertNotEqual(expectedMovies, receivedMovies)
    }
    
    func test_numberOfMovieSections() {
        // Given
        let expectedValue = 5
        let movies = MovieFactory.generateMoviesMock()!.results
        sut.moviesSections = [1: movies, expectedValue: movies]
        
        // When
        let receivedValue = sut.numberOfMovieSections()
        
        // Then
        XCTAssertEqual(expectedValue, receivedValue)
    }
    
    func test_discoverMovies_withExistingFilms() {
        // Given
        let movies = MovieFactory.generateMoviesMock()!.results
        sut.moviesSections = [1: movies, 2: movies]
        
        // When
        sut.discoverMovies(from: 2)
        
        // Then
        XCTAssertEqual(spyUseCase.getDiscoveredMoviesCallCount, 0)
    }
    
    func test_discoverMovies_withNonExistingFilms() {
        // Given
        let movies = MovieFactory.generateMoviesMock()!.results
        sut.moviesSections = [1: movies, 2: movies]
        
        // When
        sut.discoverMovies(from: 3)
        
        // Then
        XCTAssertEqual(spyUseCase.getDiscoveredMoviesCallCount, 1)
    }
    
    func test_openDetail_withAboveAverageFilm() {
        // Given
        let movie = MovieFactory.generateMoviesMock()!.results.first!
        
        // When
        sut.openDetail(with: movie)
        
        // Then
        XCTAssertEqual(spyViewController.presentDetailCallCount, 1)
    }
    
    func test_openDetail_withBelowAverageFilm() {
        // Given
        let movie = MovieFactory.generateMoviesMock()!.results.last!
        
        // When
        sut.openDetail(with: movie)
        
        // Then
        XCTAssertEqual(spyViewController.displayAlertCallCount, 1)
    }
    
    func test_fetchMovies_success() {
        // Given
        let expectedMovies = MovieFactory.generateMoviesMock()
        spyUseCase.responseType = .success(expectedMovies!)
        
        // When
        sut.fetchMovies(from: 1)
        
        // Then
        XCTAssertEqual(spyUseCase.successCallCount, 1)
        XCTAssertEqual(spyUseCase.failureCallCount, 0)
        XCTAssertEqual(sut.moviesSections[1], expectedMovies?.results)
        XCTAssertEqual(spyViewController.showMoviesCallCount, 1)
        XCTAssertEqual(spyViewController.displayAlertCallCount, 0)
    }
    
    func test_fetchMovies_failure() {
        // Given
        spyUseCase.responseType = .failure(ErrorResponse.invalidResponse)
        
        // When
        sut.fetchMovies(from: 1)
        
        // Then
        XCTAssertEqual(spyUseCase.successCallCount, 0)
        XCTAssertEqual(spyUseCase.failureCallCount, 1)
        XCTAssertEqual(spyViewController.showMoviesCallCount, 0)
        XCTAssertEqual(spyViewController.displayAlertCallCount, 1)
    }
}
