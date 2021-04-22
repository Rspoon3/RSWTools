//
//  Color+Extension.swift
//  
//
//  Created by Richard Witherspoon on 1/21/21.
//

import SwiftUI


public extension Color{
    static let safari = Color(.safari)

    init(hex: String) {
        self.init(UIColor(hex: hex))
    }
    
    static func random(opacity: CGFloat = 1.0)->Color{
        return Color(.random(alpha: opacity))
    }
    
    func lighter(by percentage: CGFloat = 30.0) -> Color {
        let uiColor = UIColor(self)
        let adjustedColor = uiColor.lighter(by: percentage)
        return Color(adjustedColor)
    }
    
    func darker(by percentage: CGFloat = 30.0) -> Color {
        let uiColor = UIColor(self)
        let adjustedColor = uiColor.darker(by: percentage)
        return Color(adjustedColor)
    }
}

