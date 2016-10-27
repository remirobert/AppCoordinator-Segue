//
//  AppDelegate.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 24/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIStoryboardSegue.addCoordination()
        
        guard let controller = self.window?.rootViewController as? UINavigationController,
            let rootController = controller.topViewController as? WelcomeViewController else {
            fatalError("No root Coordinated controller")
            return true
        }
        self.appCoordinator = AppCoordinator(rootController: rootController)
        self.appCoordinator.start()
        return true
    }
}

