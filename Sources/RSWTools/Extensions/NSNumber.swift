//
//  NSNumber.swift
//  RSWTools
//
//  Created by Richard Witherspoon on 5/20/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import Foundation

extension NSNumber {
    public func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: self) ?? "comma error"
    }
}
