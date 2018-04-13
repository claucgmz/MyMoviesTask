//
//  ParseHandler.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import PromiseKit
import ObjectMapper

struct ParseHandler {
  static func parseMovie(with data: [String: Any]) -> Movie? {
    guard let movie = Mapper<Movie>().map(JSON: data) else {
      return nil
    }
    return movie
  }
  
  static func parseMovies(with data: [String: Any]) -> [Movie] {
    var movies = [Movie]()
    guard let results = data["results"] as? [[String: Any]] else {
      return movies
    }
    movies = Mapper<Movie>().mapArray(JSONArray: results)
    return movies
  }
}
