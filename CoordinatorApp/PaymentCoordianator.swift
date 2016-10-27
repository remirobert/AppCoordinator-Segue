//
//  PaymentCoordianator.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol PaymentCoordianatorDelegate: class {
    func didLoginUser(user: User)
}

class PaymentCoordianator: Coordinator {

    weak var delegate: PaymentCoordianatorDelegate?
    
    fileprivate let rootController: PaymentViewController
    fileprivate var loginCoordinator: LoginCoordinator?
    
    func start() {
        self.rootController.delegate = self
        self.rootController.coordinationDelegate = self
    }
    
    init(rootController: PaymentViewController) {
        self.rootController = rootController
    }
}

extension PaymentCoordianator: CoordinationDelegate {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?) {
        if id == "loginSegue" {
            guard let rootController = (destination as? UINavigationController)?.topViewController as? LoginViewController else { return }
            self.loginCoordinator = LoginCoordinator(rootController: rootController)
            self.loginCoordinator?.delegate = self
            self.loginCoordinator?.start()
        }
    }
}

extension PaymentCoordianator: LoginCoordinatorDelegate {
    func didLogin(user: User) {
        self.delegate?.didLoginUser(user: user)
    }
}

extension PaymentCoordianator: PaymentViewControllerDelegate {
    func didPaidSuccess() {
        let _ = self.rootController.navigationController?.popViewController(animated: true)
    }
}
