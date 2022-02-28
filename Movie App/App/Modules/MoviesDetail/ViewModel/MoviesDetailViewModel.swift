//
//  MoviesDetailViewModel.swift
//  Movie App
//
//  Created by Fran Nasich on 28/02/2022.
//

import Foundation

class MoviesDetailViewModel {
    private var moviesService: MoviesDetailService
    private var movies = [MovieDetail]()
    private var delegate: MoviesDetailDelegate
    
    init(service: MoviesDetailService, delegate: MoviesDetailDelegate) {
        self.moviesService = service
        self.delegate = delegate
    }
    
    func getMovie() {
        moviesService.getMovies {movies in
            self.delegate.toogleLoading()
            self.movies = movies
            self.delegate.loadMovieData()
        } onError: {
            self.delegate.showError()
        }
    }
}
