//
//  AppDelegate.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        nav.viewControllers = [ListViewController()]
        window!.rootViewController = nav
        window!.makeKeyAndVisible()
        return true
    }
}

