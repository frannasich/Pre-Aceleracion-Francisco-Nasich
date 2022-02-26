//
//  MoviesListViewController.swift
//  Movie App
//
//  Created by Fran Nasich on 26/02/2022.
//

import UIKit

protocol MoviesListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
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
        self.tableView.register(UINib(nibName: "MoviesListTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesListTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension MoviesListViewController: MoviesListDelegate{
    func toogleLoading() {
        
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func showError() {
        print("Ocurrio un error")
    }
}


extension MoviesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getMoviesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListTableViewCell", for: indexPath) as! MoviesListTableViewCell
        
        cell.MovieLabelName.text = self.viewModel?.getMovie(at: indexPath.row).title
        
        return cell
    }
    
    
}
