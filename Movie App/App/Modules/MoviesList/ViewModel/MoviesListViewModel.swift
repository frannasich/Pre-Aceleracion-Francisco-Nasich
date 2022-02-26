//
//  MoviesListViewModel.swift
//  Movie App
//
//  Created by Fran Nasich on 26/02/2022.
//

import Foundation

class MoviesListViewModel {
    
    private var moviesService: MoviesListService
    private var movies = [MovieList]()
    private var delegate: MoviesListDelegate
    
    init(service: MoviesListService, delegate: MoviesListDelegate) {
        self.moviesService = service
        self.delegate = delegate
    }
    
    func getMovies(){
        moviesService.getMovies {movies in
            self.movies = movies
            self.delegate.reloadTable()
        } onError: {
            self.delegate.reloadTable()
        }
    }
    
    func getMovie(at index: Int) -> MovieList {
        return movies[index]
    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
}
