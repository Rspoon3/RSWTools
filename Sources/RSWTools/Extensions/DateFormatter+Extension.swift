//
//  DateFormatter+Extension.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 4/8/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import Foundation

public extension DateFormatter{
    convenience init(dateStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
    }
    
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
