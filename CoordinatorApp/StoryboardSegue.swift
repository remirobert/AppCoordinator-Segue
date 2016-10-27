//
//  StoryboardSegue.swift
//  TestSegue
//
//  Created by Remi Robert on 22/09/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

extension UIStoryboardSegue {
    private static var lock = false
    
    class func addCoordination() {
        if self.lock {
            return
        }
        self.lock = true
        let originalPerformSelector = #selector(UIStoryboardSegue.perform as (UIStoryboardSegue) -> () -> Void)
        let swizzledPerformSelector = #selector(UIStoryboardSegue.swizzledPerform)
        method_exchangeImplementations(class_getInstanceMethod(UIStoryboardSegue.self, originalPerformSelector),
                                       class_getInstanceMethod(UIStoryboardSegue.self, swizzledPerformSelector))
    }
    
    func swizzledPerform() {
        defer {
            self.swizzledPerform()
        }
        guard let sourceViewController = self.source as? Coordinated else {
            return
        }
        if let destinationViewController = self.destination as? Coordinated {
            destinationViewController.coordinationDelegate = sourceViewController.coordinationDelegate
        }
        sourceViewController.coordinationDelegate?.coordinate(from: sourceViewController, to: self.destination, identifier: self.identifier)
    }
}
