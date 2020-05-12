//
//  AppDelegate.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }
    
    private func setRootViewController() {
        let routing = NewsRouting()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = routing.navigationController
        window?.makeKeyAndVisible()
    }

}

