//
//  MoviesDetailViewModel.swift
//  Movie App
//
//  Created by Fran Nasich on 28/02/2022.
//

import Foundation

class MoviesDetailViewModel {
    private var moviesService: MoviesDetailService
    private var delegate: MoviesDetailDelegate
    private var movieId: String
    
    init(movieUrl: String ,service: MoviesDetailService, delegate: MoviesDetailDelegate) {
        self.moviesService = service
        self.delegate = delegate
        self.movieId = movieUrl
    }
    
    func getMovie() {
            self.delegate.toogleLoading()
        moviesService.getMovie(movieUrl: Constants().MoviesDetailURL + movieId + "?" + Constants().ApiKey, onComplete: { movie in
                self.delegate.loadMovieData(movie: movie)
        }, onError: {
            self.delegate.showError()
        })
    }
}
