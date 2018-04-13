//
//  UIViewController+HUD.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/13/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
  func toogleHUD(show: Bool) {
    switch show {
    case true:
      SVProgressHUD.show()
    case false:
      SVProgressHUD.dismiss()
    }
  }
}
