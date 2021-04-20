//
//  RotatingStarBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/1/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct RotatingStarBadge: View {
    @State var color = Color.yellow
    @State var timeRemaining = 2
    @State var spin = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let colors = [Color.red, Color.orange,  Color.blue,  Color.green,  Color.purple, Color.yellow]
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .foregroundColor(Color.white)
            .colorMultiply(color)
            .animation(.easeInOut(duration: 1))
            .rotation3DEffect(.degrees(spin ? 360 : 0), axis: (x: 0, y: 1, z: 0))
            .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
            .onReceive(timer) { _ in
                if !self.isHidden{
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else{
                        self.timeRemaining = 2
                        self.color = self.colors.randomElement()!
                    }
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

struct RotatingStar_Previews: PreviewProvider {
    static var previews: some View {
        RotatingStarBadge(isHidden: false)
    }
}
