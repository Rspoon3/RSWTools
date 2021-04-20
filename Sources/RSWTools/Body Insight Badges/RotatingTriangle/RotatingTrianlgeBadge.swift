//
//  TriangleBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 9/13/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct RotatingTrianlgeBadge: View {
    @State private var spin = false
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    struct SpinView: ViewModifier {
        @Binding var spin: Bool
        var negative : Bool
        var rotate : Bool
        func body(content: Content) -> some View {
            content
                .rotation3DEffect(.degrees(self.spin ? (negative ? -360 : 360) : 0), axis: (x: 0, y: 0, z: 1))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .rotationEffect(.degrees(rotate ? 180 : 0))
        }
    }
    
    public var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .leading, spacing: 0){
                HStack(spacing: 0){
                    Triangle()
                        .modifier(SpinView(spin: self.$spin, negative: true, rotate: true))
                    Triangle()
                        .modifier(SpinView(spin: self.$spin, negative: false, rotate: true))
                }
                HStack(spacing: 0){
                    Triangle()
                        .modifier(SpinView(spin: self.$spin, negative: false, rotate: false))
                    Triangle()
                        .modifier(SpinView(spin: self.$spin, negative: true, rotate: false))
                }
            }
            .opacity(self.isHidden ? Badge.opacity : 1)
            .frame(width: geo.size.width * 0.85, height:  geo.size.width * 0.85)
            .onAppear{
                if !self.isHidden{
                    self.spin.toggle()
                }
            }
        }
    }
}

struct RotatingTrianlgeBadge_Previews: PreviewProvider {
    static var previews: some View {
        RotatingTrianlgeBadge(isHidden: false)
    }
}
