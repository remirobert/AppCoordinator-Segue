//
//  LoginViewController.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func didLoginSuccess(user: User)
    func didLoginCancel()
}

class LoginViewController: UIViewController, Coordinated {
    
    weak var delegate: LoginViewControllerDelegate?
    weak var coordinationDelegate: CoordinationDelegate?
    @IBOutlet weak var textfieldUsername: UITextField!

    @IBAction func cancel(_ sender: AnyObject) {
        self.delegate?.didLoginCancel()
    }
    
    @IBAction func login(_ sender: AnyObject) {
        guard let text = self.textfieldUsername.text else { return }
        let user = User(username: text)
        self.delegate?.didLoginSuccess(user: user)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.textfieldUsername.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
