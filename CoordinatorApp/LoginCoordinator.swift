//
//  LoginCoordinator.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func didLogin(user: User)
}

class LoginCoordinator: Coordinator {
 
    weak var delegate: LoginCoordinatorDelegate?
    var rootController: LoginViewController
    
    fileprivate func dismissController() {
        self.rootController.dismiss(animated: true, completion: nil)
    }
    
    func start() {
        self.rootController.delegate = self
    }
    
    init(rootController: LoginViewController) {
        self.rootController = rootController
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func didLoginSuccess(user: User) {
        self.delegate?.didLogin(user: user)
        self.dismissController()
    }
    
    func didLoginCancel() {
        self.dismissController()
    }
}
