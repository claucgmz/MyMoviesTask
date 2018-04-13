//
//  UIView+Autolayout.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/12/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

extension UIView {
  func setSubviewForAutoLayout(_ subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(subview)
  }
  
  func setSubviewsForAutoLayout(_ subviews: [UIView]) {
    subviews.forEach(self.setSubviewForAutoLayout)
  }
}
