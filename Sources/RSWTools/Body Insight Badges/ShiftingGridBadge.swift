//
//  ShiftingGridBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/2/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct ShiftingGridBadge: View {
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var color = Color.yellow
    @State private var timeRemaining = 0.5
    @State private var move = false
    @State private var spin = false
    @State private var rotation = true
    @State private var offset: CGFloat = 0
    private let colors = [Color.red, Color.orange, Color.yellow, Color.blue, Color.green, Color.purple]
    private let multipler : CGFloat = 0.2
    
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    public var body: some View {
        GeometryReader{ geo in
            VStack{
                ForEach(0..<3){_ in
                    HStack{
                        ForEach(0..<3){_ in
                            Rectangle()
                                .foregroundColor(self.colors.randomElement()!)
                                .frame(width: geo.size.height * self.multipler, height: geo.size.height * self.multipler)
                                .rotation3DEffect(.degrees(self.spin ? (self.rotation ? -180 : 0)  : 0), axis: (x: 0, y: 0, z: 1))
                                .animation(Animation.linear(duration: 0.5))
                                .offset(x: self.move ? (self.rotation ? -self.offset : self.offset) : 0, y: 0)
                                .onAppear{
                                    withAnimation(.linear(duration: 8)) { self.offset = geo.size.width / 10 }
                            }
                        }
                        
                    }
                }
            }
            .opacity(self.isHidden ? Badge.opacity : 1)
            .onAppear{
                if !self.isHidden{
                    self.spin.toggle()
                    self.move.toggle()
                }
            }
            .onReceive(self.timer) { _ in
                if !self.isHidden{
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 0.5
                    } else{
                        self.timeRemaining = 0.5
                        self.rotation.toggle()
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ShiftingGridBadge_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingGridBadge(isHidden: false)
    }
}
#endif
