//
//  AppCoordinator.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 24/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol AppCoordinatorDelegate: class {
    func didUserLogged(user: User)
}

class AppCoordinator: Coordinator {
    
    weak var delegate: AppCoordinatorDelegate?
    fileprivate var rootController: WelcomeViewController
    fileprivate var user: User?

    fileprivate var loginCoordinator: LoginCoordinator?
    fileprivate var menuCoordinator: MenuCoordinator?
    
    func start() {
        self.rootController.coordinationDelegate = self
    }
    
    init(rootController: WelcomeViewController) {
        self.rootController = rootController
    }
}

extension AppCoordinator: CoordinationDelegate {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?) {
        if id == "loginSegue" {
            guard let rootController = (destination as? UINavigationController)?.topViewController as? LoginViewController else { return }
            self.loginCoordinator = LoginCoordinator(rootController: rootController)
            self.loginCoordinator?.delegate = self
            self.loginCoordinator?.start()
        }
        else if id == "menuSegue" {
            guard destination is MenuViewController else { return }
            (destination as! MenuViewController).user = self.user
            self.menuCoordinator = MenuCoordinator(rootController: destination as! MenuViewController)
            self.menuCoordinator?.start()
        }
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func didLogin(user: User) {
        self.user = user
        self.delegate?.didUserLogged(user: user)
    }
}
