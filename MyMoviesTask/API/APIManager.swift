//
//  APIManager.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation

struct APIManager {
  static let baseURLString = "https://api.themoviedb.org/3"
  static let APIkey = "ea9ea1afa4b2b3b489c0ce28e791a8b9"
  private static let baseImageURLString = "https://image.tmdb.org/t/p"
  
  enum ImageSizePath: String {
    case thumbnail = "/w342"
    case detail = "/w500"
    
    static func getImageURLString(_ path: ImageSizePath) -> String {
      return baseImageURLString + path.rawValue
    }
  }
}
