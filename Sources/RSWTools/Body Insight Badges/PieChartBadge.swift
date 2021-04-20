//
//  PieChartBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 10/7/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

struct WedgeShape: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let lineWidth: CGFloat
    let angleOffset = Angle(degrees: -90)

    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center =  CGPoint(x: rect.size.width/2, y: rect.size.height / 2)
        let r1 = rect.size.width/2
        p.addArc(center: center, radius: abs(lineWidth - r1), startAngle: startAngle + angleOffset, endAngle: endAngle + angleOffset, clockwise: false)
        p.addArc(center: center, radius: r1, startAngle: endAngle + angleOffset, endAngle: startAngle + angleOffset, clockwise: true)
        p.closeSubpath()
        return p
    }
}

struct Wedge {
    var startAngle: Double
    var endAngle: Double
    var color: Color
}

public struct PieChartBadge: View {
    @State private var move = false
    let wedges = [
        Wedge(startAngle: -0, endAngle: 100, color: Color.blue),
        Wedge(startAngle: 100, endAngle: 205, color: Color.green),
        Wedge(startAngle: 205, endAngle: 360, color: Color.red)
    ]
    
    private var animation : Animation{
        Animation.linear(duration: Double.random(in: 3...6)).repeatForever(autoreverses: true)
    }
    
    private var rotationAnimation : Animation{
        Animation.linear(duration: 20).repeatForever()
    }
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0 ..< self.wedges.count) {
                    WedgeShape(
                        startAngle: Angle(degrees: self.wedges[$0].startAngle),
                        endAngle: Angle(degrees: self.wedges[$0].endAngle),
                        lineWidth: geometry.size.width / 4
                    )
                        .foregroundColor(self.wedges[$0].color)
                        .scaleEffect(self.move ? 1 : CGFloat.random(in: 0.2...0.7))
                        .animation(self.isHidden ? nil : self.animation)
                }
            }
            .opacity(self.isHidden ? Badge.opacity : 1)
            .rotationEffect(.degrees(self.move ? 360 : 0))
            .animation(self.isHidden ? nil : self.rotationAnimation)
            .onAppear{
                self.move.toggle()
            }
        }
    }
}

struct PieChartBadge_Previews: PreviewProvider {
    static var previews: some View {
        PieChartBadge(isHidden: false)
    }
}
