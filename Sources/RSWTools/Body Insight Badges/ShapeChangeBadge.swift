//
//  ShapeChangeBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/2/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct ShapeChangeBadge: View {
    @State var scale : CGFloat = 1
    let shapes = ["sun.max.fill", "star.fill", "heart.fill", "rectangle.fill", "suit.club.fill", "suit.diamond.fill", "suit.spade.fill", "star.circle", "moon.fill", "moon.circle.fill", "cloud.fill", "sparkles", "moon.zzz.fill", "cloud.moon.fill", "flame.fill", "shield.fill", "hexagon.fill", "burst.fill", "triangle.fill", "circle.fill", "largecircle.fill.circle", "smallcircle.circle.fill", "smallcircle.fill.circle.fill"]
    @State var shapeName = "sun.max.fill"
    @State private var offset: CGFloat = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 2
    let colors = [Color.red, Color.orange,  Color.blue,  Color.green,  Color.purple, Color.yellow]
    @State var color = Color.yellow
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        Image(systemName: shapeName)
            .resizable()
            .foregroundColor(color)
            .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
            .opacity(self.isHidden ? Badge.opacity : 1)
            .onReceive(timer) { _ in
                if !self.isHidden{
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 2
                        self.scale = 0
                    } else{
                        self.shapeName = self.shapes.filter({$0 != self.shapeName}).randomElement()!
                        self.color = self.colors.filter({$0 != self.color}).randomElement()!
                        self.timeRemaining = 2
                    }
                }
        }
    }
}

struct ShapeChangeBadge_Previews: PreviewProvider {
    static var previews: some View {
        ShapeChangeBadge(isHidden: false)
    }
}
