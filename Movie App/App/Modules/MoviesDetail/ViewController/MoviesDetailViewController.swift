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

    @IBOutlet weak var movieDetailTitle: UILabel!
    @IBOutlet weak var originalLanguage: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    private let service = MoviesDetailService()
    private var viewModel: MoviesDetailViewModel?
    var movieId: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = movieId  {
            self.viewModel = MoviesDetailViewModel(movieUrl: Constants().MoviesDetailURL + url + "?" + Constants().ApiKey, service: self.service, delegate: self)
            self.viewModel?.getMovie()
        }
    }
    
    private func setupView() {
        self.title = "Detalles de la película"
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
    }
    
    func showError() {
        print("Ha ocurrido un error")
    }
}
