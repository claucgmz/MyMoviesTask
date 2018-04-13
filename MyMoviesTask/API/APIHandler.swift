//
//  APIHandler.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import PromiseKit

struct APIHandler {
  static func getMovies(for type: MovieType, page: Int) -> Promise <[String: Any]> {
    return Server.performGenericRequest(MoviesRouter.getMovies(type: type, page: page))
  }
  
  static func getMovie(withId id: Int) -> Promise <[String: Any]> {
    return Server.performGenericRequest(MoviesRouter.getMovie(id: id))
  }
}
