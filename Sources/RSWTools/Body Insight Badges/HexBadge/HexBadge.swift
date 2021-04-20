//
//  HexBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 9/13/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

struct HexBadge: View {
    static let rotationCount = 8
    @State private var spin = false
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    var badgeSymbols: some View {
        ForEach(0..<HexBadge.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(HexBadge.rotationCount)) * 360.0, isHidden: self.isHidden
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
                .rotationEffect(.degrees(self.spin ? -360 : 0))
                .animation(Animation.linear(duration : 20).repeatForever(autoreverses: false))
                .onAppear{
                    if !self.isHidden{
                        self.spin.toggle()
                    }
            }
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .opacity(self.isHidden ? Badge.opacity : 1)
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        HexBadge(isHidden: false)
    }
}
