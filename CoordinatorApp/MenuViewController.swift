//
//  MenuViewController.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: class {
    func displayPayment(menu: Menu, withUser user: User?)
}

class MenuViewController: UIViewController, Coordinated {

    weak var coordinationDelegate: CoordinationDelegate?
    weak var delegate: MenuViewControllerDelegate?
    
    fileprivate var menus = generateRandomData()
    var user: User?
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell")!
        let menu = self.menus[indexPath.row]
        cell.textLabel?.text = menu.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = self.menus[indexPath.row]
        self.delegate?.displayPayment(menu: menu, withUser: self.user)
    }
}
