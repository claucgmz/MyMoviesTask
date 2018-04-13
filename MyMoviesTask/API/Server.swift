//
//  Server.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Alamofire
import PromiseKit

struct Server {
  static func performGenericRequest(_ urlRequest: Alamofire.URLRequestConvertible) -> Promise<[String: Any]> {
    return Promise { resolve in
      Alamofire.request(urlRequest)
      .validate()
      .responseJSON(completionHandler: { response in
        if let json = response.result.value as? [String: Any] {
          resolve.fulfill(json)
        } else if let error = response.error {
          resolve.reject(error)
        }
      })
    }
  }
}
