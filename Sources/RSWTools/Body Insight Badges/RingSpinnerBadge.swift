//
//  RingSpinnerBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/11/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct RingSpinnerBadge : View {
    @State var pct: Double = 0.0
    
    var animation: Animation {
        Animation.easeInOut(duration: 3.5).repeatForever(autoreverses: false)
    }
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    
                    path.addArc(center: CGPoint(x: geometry.size.width/2, y: geometry.size.width/2),
                                radius: geometry.size.width/3,
                                startAngle: Angle(degrees: 0),
                                endAngle: Angle(degrees: 360),
                                clockwise: true)
                }
                .stroke(Color.blue, lineWidth: geometry.size.width / 3)
                
                InnerRing(pct: self.pct)
                    .stroke(Color.orange, lineWidth: geometry.size.width / 7)
            }
        }
        .opacity(self.isHidden ? Badge.opacity : 1)
        .aspectRatio(1, contentMode: .fit)
        .onAppear() {
            if !self.isHidden{
                withAnimation(self.animation) {
                    self.pct = 1
                }
            }
        }
    }
    
}

struct InnerRing : Shape {
    var lagAmmount = 0.35
    var pct: Double
    
    func path(in rect: CGRect) -> Path {
        
        let end = pct * 360
        var start: Double
        
        if pct > (1 - lagAmmount) {
            start = 360 * (2 * pct - 1.0)
        } else if pct > lagAmmount {
            start = 360 * (pct - lagAmmount)
        } else {
            start = 0
        }
        
        var p = Path()
        
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/3,
                 startAngle: Angle(degrees: start),
                 endAngle: Angle(degrees: end),
                 clockwise: false)
        
        return p
    }
    
    var animatableData: Double {
        get { return pct }
        set { pct = newValue }
    }
}
