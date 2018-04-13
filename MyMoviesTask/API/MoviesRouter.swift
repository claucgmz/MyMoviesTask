//
//  MoviesRouter.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Alamofire

enum MoviesRouter: URLRequestConvertible {
  case getMovie(id: Int)
  case getMovies(type: MovieType, page: Int)
  
  var path: String {
    switch self {
    case .getMovie(let id):
      return "/movie/\(id)"
    case .getMovies(let type, _):
      switch type {
      case .upcoming:
        return "/movie/upcoming"
      case .featured:
        return "/movie/popular"
      case .playing:
        return "/movie/now_playing"
      }
    }
  }
  
  var parameters: [String: Any] {
    var parameters: [String: Any] = [:]
    switch self {
    case .getMovie:
      parameters = [:]
    case .getMovies(_, let page):
      parameters = ["page": page]
    }
      
    parameters["api_key"] = APIManager.APIkey
    return parameters
  }
  
  var method: HTTPMethod {
    switch self {
    case .getMovie, .getMovies:
      return .get
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = try APIManager.baseURLString.asURL()
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    print(url.appendingPathComponent(path))
    urlRequest.httpMethod = method.rawValue
    return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
  }
}
