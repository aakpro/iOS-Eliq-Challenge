//
//  AppAppearance.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/8/20.
//

import UIKit

/// Set initial appearance for all the app
final class AppAppearance: NSObject
{
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().tintColor = .systemPink
        UIBarButtonItem.appearance().tintColor = .systemPink
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]

    }
}

extension UINavigationController {
    @objc override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
