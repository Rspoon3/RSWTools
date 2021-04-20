//
//  Date+Extension.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 12/12/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import Foundation

public extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
}
