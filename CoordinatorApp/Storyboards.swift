//
//  Storyboards.swift
//  CatNet-iOS
//
//  Created by Remi Robert on 21/09/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

enum Storyboards: String {
    case Directory = "RootDirectoryList"
    case CreateDirectory = "CreateDirectory"
}

extension Storyboards {
    
    private func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func instance(controller identifier: String) -> UIViewController {
        return self.storyboard().instantiateViewController(withIdentifier: identifier)
    }
    
    func instanceRoot() -> UIViewController? {
        return self.storyboard().instantiateInitialViewController()
    }
}
