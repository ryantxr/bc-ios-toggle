//
//  UIControl+Extension.swift
//  Toggle
//
//  Created by ryan teixeira on 11/6/17.
//  Copyright © 2017 Blazecore. All rights reserved.
//


import Foundation
import UIKit
import ObjectiveC

// https://stackoverflow.com/questions/24133058/is-there-a-way-to-set-associated-objects-in-swift#25428409
// Declare a global var to produce a unique address as the assoc object handle
var AssociatedObjectHandle: UInt8 = 0

extension UIControl
{
    var row: Int? {
        get {
            
            if let n = objc_getAssociatedObject(self, &AssociatedObjectHandle) as? NSNumber {
                return n.intValue
            }
            return nil
        }
        set {
            guard let newValue = newValue else {
                return
            }
            let numberObject = NSNumber(integerLiteral: newValue)
            objc_setAssociatedObject(self, &AssociatedObjectHandle, numberObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
