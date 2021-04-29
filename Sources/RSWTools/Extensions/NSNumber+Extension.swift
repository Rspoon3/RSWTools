//
//  NSNumber+Extension.swift
//  RSWTools
//
//  Created by Richard Witherspoon on 5/20/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import Foundation

public extension NSNumber {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = .current
        return numberFormatter.string(from: self) ?? "comma error"
    }
}
