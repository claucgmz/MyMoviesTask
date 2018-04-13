//
//  AppDelegate.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/12/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    setInitialViewController()
    return true
  }
  
  private func setInitialViewController() {
    window = UIWindow(frame: UIScreen.main.bounds)
    let initialViewController = MoviesTableViewController()
    let navigationController = UINavigationController(rootViewController: initialViewController)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}
