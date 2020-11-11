//
//  AppDelegate.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/8/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    let appDIContainer = AppDIContainer()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppAppearance.setupAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = appDIContainer.makeMainSceneDIContainer().makeMainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

