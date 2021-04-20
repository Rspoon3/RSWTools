//
//  SpikyCircleBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 10/7/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct SpikyCircleBadge: View {
    private let radius : CGFloat = 10
    @State private var spin = false
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                ForEach(0..<6){ index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: geometry.size.width * 0.7, height: geometry.size.width * 0.7)
                        .rotationEffect(.degrees(self.spin ? 360 : 0))
                        .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false).delay(Double(index)))
                }.overlay(
                    Circle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.5)
                )
            }
            .opacity(self.isHidden ? 0.05 : 1)
            .onAppear{
                if !self.isHidden{
                    self.spin.toggle()
                }
            }
            
        }
    }
}

struct SpikyCircleBadges_Previews: PreviewProvider {
    static var previews: some View {
        SpikyCircleBadge(isHidden: false)
    }
}
