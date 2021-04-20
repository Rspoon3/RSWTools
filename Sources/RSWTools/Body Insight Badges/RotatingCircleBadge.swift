//
//  RotatingCircleBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/1/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct RotatingCircleBadge: View {
    @State private var spin = false
    private var dashWith : CGFloat = 30
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        ZStack{
            Circle()
                .stroke(Color.red, style: .init(lineWidth: 10, lineCap: .round, dash: [dashWith]))
                .rotationEffect(.degrees(spin ? 360 : 0))
                .animation(Animation.linear(duration: 60).repeatForever(autoreverses: false))
                .scaleEffect(0.85)
            Circle()
                .stroke(Color.blue, style: .init(lineWidth: 10, lineCap: .round, dash: [dashWith]))
                .rotationEffect(.degrees(spin ? -360 : 0))
                .animation(Animation.linear(duration: 30).repeatForever(autoreverses: false))
                .scaleEffect(0.65)
            Circle()
                .stroke(Color.green, style: .init(lineWidth: 10, lineCap: .round, dash: [dashWith]))
                .rotationEffect(.degrees(spin ? 360 : 0))
                .animation(Animation.linear(duration: 15).repeatForever(autoreverses: false))
                .scaleEffect(0.45)
            Circle()
                .stroke(Color.yellow, style: .init(lineWidth: 10, lineCap: .round, dash: [dashWith]))
                .rotationEffect(.degrees(spin ? -360 : 0))
                .animation(Animation.linear(duration: 7.5).repeatForever(autoreverses: false))
                .scaleEffect(0.25)
            
        }
        .opacity(self.isHidden ? Badge.opacity : 1)
        .onAppear{
            if !self.isHidden{
                self.spin.toggle()
            }
        }
    }
}

struct RotatingCircleBadge_Previews: PreviewProvider {
    static var previews: some View {
        RotatingCircleBadge(isHidden: false)
    }
}
