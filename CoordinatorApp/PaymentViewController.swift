//
//  PaymentViewController.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol PaymentViewControllerDelegate: class {
    func didPaidSuccess()
}

class PaymentViewController: UIViewController, Coordinated {

    @IBOutlet weak var labelMenuName: UILabel!
    @IBOutlet weak var buttonBuy: UIButton!
    @IBOutlet var viewWarning: UIView!
    
    weak var coordinationDelegate: CoordinationDelegate?
    weak var delegate: PaymentViewControllerDelegate?

    var user: User?
    var menu: Menu?
    
    @IBAction func buy(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Payment success", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { _ in
            self.delegate?.didPaidSuccess()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (self.coordinationDelegate as? PaymentCoordianator)?.delegate = self

        self.labelMenuName.text = self.menu?.name
        if self.user == nil {
            self.viewWarning.frame = self.view.bounds
            self.view.addSubview(self.viewWarning)
            return
        }
    }
}

extension PaymentViewController: PaymentCoordianatorDelegate {
    func didLoginUser(user: User) {
        self.user = user
        self.viewWarning.removeFromSuperview()
    }
}
