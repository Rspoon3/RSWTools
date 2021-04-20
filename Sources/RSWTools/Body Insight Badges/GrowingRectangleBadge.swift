//
//  GrowingRectangleBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 10/2/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct SquareToCircleBadge: View {
    let time : Double = 3
    @State private var animate = false
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: self.animate ? (geometry.size.width / 2) : 0)
                    .fill(Color.green)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .animation(Animation.linear(duration: self.time).repeatForever(autoreverses: true))
                RoundedRectangle(cornerRadius: self.animate ? (geometry.size.width / 2) : 0)
                    .fill(Color.red)
                    .frame(width: geometry.size.width - geometry.size.width * 0.1, height: geometry.size.width - geometry.size.width * 0.1)
                    .animation(Animation.linear(duration: self.time).repeatForever(autoreverses: true))
                RoundedRectangle(cornerRadius: self.animate ? (geometry.size.width / 2) : 0)
                    .fill(Color.yellow)
                    .frame(width: geometry.size.width - geometry.size.width * 0.2, height: geometry.size.width - geometry.size.width * 0.2)
                    .animation(Animation.linear(duration: self.time).repeatForever(autoreverses: true))
                RoundedRectangle(cornerRadius: self.animate ? (geometry.size.width / 2) : 0)
                    .fill(Color.blue)
                    .frame(width: geometry.size.width - geometry.size.width * 0.3, height: geometry.size.width - geometry.size.width * 0.3)
                    .animation(Animation.linear(duration: self.time).repeatForever(autoreverses: true))
                RoundedRectangle(cornerRadius: self.animate ? (geometry.size.width / 2) : 0)
                    .fill(Color.orange)
                    .frame(width: geometry.size.width - geometry.size.width * 0.4, height: geometry.size.width - geometry.size.width * 0.4)
                    .animation(Animation.linear(duration: self.time).repeatForever(autoreverses: true))
            }
            .opacity(self.isHidden ? Badge.opacity : 1)
            .onAppear{
                if !self.isHidden{
                    self.animate.toggle()
                }
            }
        }
    }
}

struct SquareToCircleBadge_Previews: PreviewProvider {
    static var previews: some View {
        SquareToCircleBadge(isHidden: false)
    }
}

