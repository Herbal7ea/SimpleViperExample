//
//  AppDelegate.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
            navigationController.navigationBar.isTranslucent = false

        MainRouter.shared.initialize(with: navigationController)
        navigationController.setViewControllers([MainRouter.shared.firstViewController], animated: false)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

