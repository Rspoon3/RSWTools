//
//  UITextField+Extension.swift
//  LBTATools
//
//  Created by Brian Voong on 5/7/19.
//

import UIKit

public extension UITextField {

    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
}
