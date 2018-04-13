//
//  MoviesService.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import PromiseKit

struct MoviesService {
  static func getMovie(withId id: Int) -> Promise <Movie?> {
    return APIHandler.getMovie(withId: id).map { data -> Movie? in
      guard let movie = ParseHandler.parseMovie(with: data) else {
        return nil
      }
      return movie
    }
  }
  
  static func getMovies(for type: MovieType, page: Int = 1) -> Promise <[Movie]> {
    return APIHandler.getMovies(for: type, page: page).map { data -> [Movie] in
      return ParseHandler.parseMovies(with: data)
    }
  }
}
