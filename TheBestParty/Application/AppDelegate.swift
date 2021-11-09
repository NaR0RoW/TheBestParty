//
//  AppDelegate.swift
//  TheBestParty
//
//  Created by NaR_RoW on 09.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = RandomCocktailViewController()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
