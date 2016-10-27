//
//  MenuCoordinator.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class MenuCoordinator: Coordinator {
    
    fileprivate let rootController: MenuViewController
    fileprivate var paymentCoordinator: PaymentCoordianator?
    var user: User?
    var menu: Menu?
    
    func start() {
        self.rootController.coordinationDelegate = self
        self.rootController.delegate = self
    }
    
    init(rootController: MenuViewController) {
        self.rootController = rootController
    }
}

extension MenuCoordinator: CoordinationDelegate {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?) {
        if id == "paymentSegue" {
            guard let controller = destination as? PaymentViewController else { return }
            self.paymentCoordinator = PaymentCoordianator(rootController: controller)
            self.paymentCoordinator?.start()
            controller.user = self.user
            controller.menu = self.menu
        }
        print("receive segue okay")
    }
}

extension MenuCoordinator: MenuViewControllerDelegate {
    func displayPayment(menu: Menu, withUser user: User?) {
        self.menu = menu
        self.user = user
        self.rootController.performSegue(withIdentifier: "paymentSegue", sender: nil)
    }
}
