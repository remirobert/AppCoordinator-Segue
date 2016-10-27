//
//  Coordianator.swift
//  CatNet-iOS
//
//  Created by Remi Robert on 21/09/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    func start()
}

public protocol Coordinated: class {
    var coordinationDelegate: CoordinationDelegate? { get set }
}

public protocol CoordinationDelegate: class {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?)
}

public extension CoordinationDelegate {
    public func coordinate(data source: AnyObject, from controller: Coordinated) {}
}
