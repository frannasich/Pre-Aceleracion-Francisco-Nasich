//
//  MoviesDetailViewController.swift
//  Movie App
//
//  Created by Fran Nasich on 28/02/2022.
//

protocol MoviesDetailDelegate {
    func toogleLoading()
    func loadMovieData(movie : MovieDetail)
    func showError()
}

import UIKit

class MoviesDetailViewController: UIViewController {

    @IBOutlet weak var movieImagePortrait: UIImageView!
    @IBOutlet weak var movieDetailTitle: UILabel!
    @IBOutlet weak var originalLanguage: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    private let service = MoviesDetailService()
    private var viewModel: MoviesDetailViewModel?
    var movieUrl: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = movieUrl {
            self.viewModel = MoviesDetailViewModel(movieUrl: url, service: self.service, delegate: self)
            self.viewModel?.getMovie()
        }
    }
    
    private func setupView() {
        self.title = "Movies Details"
    }
    
    }
    
extension MoviesDetailViewController: MoviesDetailDelegate {

    func toogleLoading() {
        print("Cargando")
    }
    
    func loadMovieData(movie: MovieDetail) {
        self.movieDetailTitle.text = movie.title
        self.originalLanguage.text = movie.originalLanguage
        self.moviePopularity.text = String(describing: movie.popularity)
        self.movieReleaseDate.text = movie.releaseDate
        self.movieOverview.text = movie.overview
        
        if let url = movie.backdropPath, let fullUrl = URL(string: Constants().imageURL + url){
                    self.movieImagePortrait.load(url: fullUrl)
        }
    }
    
    func showError() {
        print("Ha ocurrido un error")
    }
}


