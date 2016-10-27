//
//  Menu.swift
//  CoordinatorApp
//
//  Created by Remi Robert on 27/10/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

struct Menu {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

func generateRandomData() -> [Menu] {
    return  [
        Menu(name: "🍕"),
        Menu(name: "🍙"),
        Menu(name: "🍿"),
        Menu(name: "🍪")
    ]
}
