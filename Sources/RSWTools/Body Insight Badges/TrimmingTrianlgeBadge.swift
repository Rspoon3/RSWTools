//
//  RotatingTrianlgeBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 10/7/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct TrimmingTrianlgeBadge: View {
    let radius : CGFloat = 10
    @State private var move = false
    @State private var trimAmount : CGFloat = 0
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .frame(width: geometry.size.width, height: geometry.size.width)
                .overlay(
                    Rectangle()
                        .trim(from: self.trimAmount, to: self.isHidden ? 0.5 : (self.move ? 1 : 0))
                        .fill(Color.red)
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
            )
                .opacity(self.isHidden ? Badge.opacity : 1)
                .onAppear{
                    if !self.isHidden{
                        self.move.toggle()
                    }
            }
        }
    }
}


struct TrimmingTrianlgeBadge_Previews: PreviewProvider {
    static var previews: some View {
        TrimmingTrianlgeBadge(isHidden: false)
    }
}
