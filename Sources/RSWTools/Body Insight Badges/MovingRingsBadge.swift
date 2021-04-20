//
//  MovingRingsBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/1/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct MovingRingsBadge: View {
    @State private var primaryColor = Color.red
    @State private var secondaryColor = Color.blue
    @State private var timeRemaining = 4
    @State private var spin = false
    let dashWith : CGFloat = 40
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let primaryColors = [Color.red, Color.orange, Color.yellow]
    let secondaryColors = [Color.blue, Color.green, Color.purple]
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        VStack{
            //Text("\(timeRemaining)")
            ZStack{
                Circle()
                    .stroke(primaryColor, style: .init(lineWidth: 10, lineCap: .round, dash: [dashWith]))
                    .animation(Animation.linear(duration: 0.5))
                    .rotationEffect(.degrees(spin ? 360 : 0))
                    .animation(Animation.linear(duration: 40).repeatForever(autoreverses: false))
                    .scaleEffect(0.85)
                Circle()
                    .stroke(secondaryColor, style: .init(lineWidth: 10, lineCap: .round, dash: [dashWith]))
                    .animation(Animation.linear(duration: 0.5))
                    .rotationEffect(.degrees(spin ? 360 : 0))
                    .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false))
                    .scaleEffect(0.85)
            }
            .onReceive(timer) { _ in
                if self.isHidden{
                    return
                }
                
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else{
                    self.timeRemaining = 4
                    self.primaryColor = self.primaryColors.randomElement()!
                    self.secondaryColor = self.secondaryColors.randomElement()!
                }
            }
            .opacity(self.isHidden ? Badge.opacity : 1)
            .onAppear{
                if !self.isHidden{
                    self.spin.toggle()
                }
            }
        }
    }
}

struct MovingRingsBadge_Previews: PreviewProvider {
    static var previews: some View {
        MovingRingsBadge(isHidden: false)
    }
}
