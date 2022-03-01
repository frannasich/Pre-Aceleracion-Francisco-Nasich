//
//  MoviesListViewController.swift
//  Movie App
//
//  Created by Fran Nasich on 27/02/2022.
//

import UIKit

protocol MoviesListDelegate {
    func toogleLoading()
    func reloadTable()
}

class MoviesListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let service = MoviesListService()
    private var viewModel: MoviesListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MoviesListViewModel(service: self.service, delegate: self)
        self.viewModel?.getMovies()
        setupView()
    }
    
    private func setupView() {
        self.title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(UINib(nibName: "MoviesListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension MoviesListViewController: MoviesListDelegate{
    func toogleLoading() {
        print("Cargando")
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
}

extension MoviesListViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.viewModel?.getMovie(at: indexPath.row)
        let movieDetail = MoviesDetailViewController()
        movieDetail.movieId = "\(String(describing: movie?.id))"
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}


extension MoviesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getMoviesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesListTableViewCell
        
        cell.movieLabelName.text = self.viewModel?.getMovie(at: indexPath.row).title
        
        return cell
    }
    
    
}

