//
//  RotatedBadgeSymbol.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 9/13/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    let isHidden : Bool
    
    var body: some View {
        BadgeSymbol(isHidden: isHidden)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5), isHidden: false)
    }
}
