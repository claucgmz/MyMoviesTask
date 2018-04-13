//
//  Movie.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import ObjectMapper

struct Movie: Mappable {
  var id = 0
  var title = "No title"
  var posterPath = ""
  var backPath = ""
  var sinopsis = ""
  var releaseDate = Date()
  var tagline = ""
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    id          <- map["id"]
    title       <- map["title"]
    posterPath  <- map["poster_path"]
    backPath    <- map["backdrop_path"]
    sinopsis    <- map["overview"]
    releaseDate <- (map["releaseDate"], DateTransform())
    tagline     <- map["tagline"]
  }
}
