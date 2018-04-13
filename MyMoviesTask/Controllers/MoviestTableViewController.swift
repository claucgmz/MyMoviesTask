//
//  MoviesTableViewController.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/12/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import PromiseKit

class MoviesTableViewController: UITableViewController {
  private var movies = [Movie]()

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Movies"
    configureTableView()
    getMovies()
  }
  
  private func configureTableView() {
    tableView.tableFooterView = UIView(frame: .zero)
    tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reusableId)
  }
  
  private func getMovies() {
    self.toogleHUD(show: true)
    MoviesService.getMovies(for: .playing)
      .map({ movies in
        self.movies = movies
      })
      .done {
        self.tableView.reloadData()
        self.toogleHUD(show: false)
      }
      .catch({ error -> Void in
        print(error)
      })
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movie = movies[indexPath.row]
    let cell = (tableView.dequeueReusableCell(withIdentifier: MovieCell.reusableId, for: indexPath) as? MovieCell)!
    cell.configure(withMovie: movie)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 115.0
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movie = movies[indexPath.row]
    let movieDetailViewController = MovieDetailViewController()
    movieDetailViewController.movie = movie
    self.navigationController?.pushViewController(movieDetailViewController, animated: true)
  }
}
