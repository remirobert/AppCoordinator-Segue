//
//  ViewControllerCoordinator.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 24/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ViewControllerCoordinator: Coordinator {

    func start() {
        
    }
}

extension ViewControllerCoordinator: CoordinationDelegate {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?) {
        print("source controller : \(source)")
        print("destination controller : \(destination)")
        print("identifier : \(id)")
    }
}
