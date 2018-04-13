//
//  MovieDetailViewController.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/12/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
  private weak var movieDetailView: MovieDetailView! { return self.view as? MovieDetailView }
  private weak var movieTitleLabel: UILabel! { return movieDetailView.titleLabel }
  private weak var movieTagLineLabel: UILabel! { return movieDetailView.tagLineLabel }
  private weak var movieSinopsisLabel: UILabel! { return movieDetailView.sinopsisLabel }
  private weak var movieImageView: UIImageView! { return movieDetailView.movieImageView }
  var movie: Movie!
  
  override func loadView() {
    self.view = MovieDetailView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getMovie()
  }
  
  private func getMovie() {
    self.toogleHUD(show: true)
    MoviesService.getMovie(withId: movie.id)
      .map ({ movie in
        self.movie = movie
      })
      .done {
        self.updateUI()
        self.toogleHUD(show: false)
      }
      .catch({ error -> Void in
        print(error)
      })
  }
  
  private func updateUI() {
    title = movie.title
    movieTitleLabel.text = movie.title
    movieTagLineLabel.text = movie.tagline
    movieSinopsisLabel.text = movie.sinopsis
    
    if let url = URL(string: APIManager.ImageSizePath.getImageURLString(.detail) + movie.backPath) {
      movieImageView.af_setImage(withURL: url)
    }
  }
}
