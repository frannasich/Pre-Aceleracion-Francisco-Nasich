//
//  MoviesDetailViewController.swift
//  Movie App
//
//  Created by Fran Nasich on 28/02/2022.
//

protocol MoviesDetailDelegate {
    func toogleLoading()
    func loadMovieData()
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
    private let movies: MovieDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = MoviesDetailViewModel(service: self.service, delegate: self)
    }
    
    private func setupView() {
        self.title = "Detalles de la película"
        navigationItem.largeTitleDisplayMode = .never
    }

}

extension MoviesDetailViewController: MoviesDetailDelegate {

    func toogleLoading() {
        print("Cargando")
    }
    
    func loadMovieData() {
        self.movieDetailTitle.text = movies?.title
        self.originalLanguage.text = movies?.originalLanguage
        self.moviePopularity.text = String(describing: movies?.popularity)
        self.movieReleaseDate.text = movies?.releaseDate
        self.movieOverview.text = movies?.overview
    }
    
    func showError() {
        print("Ha ocurrido un error")
    }
}
