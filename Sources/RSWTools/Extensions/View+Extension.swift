//
//  View+Extensions.swift
//  FreeTime
//
//  Created by Richard Witherspoon on 4/11/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI


public extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    @available(iOS 14.0, *)
    func addNavigationWithDismiss() -> some View{
        return self.modifier(NavigationWithDismiss())
    }
    
    @available(swift, obsoleted: 5.5, message: "This method has been removed. Please use naive APIs.")
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
