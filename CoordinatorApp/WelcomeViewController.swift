//
//  WelcomeViewController.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, Coordinated {
    
    @IBOutlet weak var labelWelcomeBack: UILabel!
    
    weak var coordinationDelegate: CoordinationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.coordinationDelegate as? AppCoordinator)?.delegate = self
    }
}

extension WelcomeViewController: AppCoordinatorDelegate {
    func didUserLogged(user: User) {
        self.labelWelcomeBack.text = "Welcome back \(user.username) !"
    }
}
