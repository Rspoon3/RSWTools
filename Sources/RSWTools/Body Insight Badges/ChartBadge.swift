//
//  ChartBadge.swift
//  
//
//  Created by Richard Witherspoon on 11/18/19.
//

import SwiftUI

public struct ChartBadge: View {
    public let isHidden : Bool
    public let type = Badge.chart
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var height : [CGFloat] = [0,0,0,0,0,0]
    @State private var radius : [CGFloat] = [0,0,0,0,0,0]
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    private let colors = [
        Color.init(.systemGreen),
        Color.init(.systemYellow),
        Color.init(.systemOrange),
        Color.init(.systemRed),
        Color.init(.systemPurple),
        Color.init(.systemBlue),
    ]
    
    public var body: some View {
        GeometryReader{ geo in
            VStack{
                HStack{
                    ForEach(0..<self.height.count){ index in
                        ZStack(alignment: .bottom){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: geo.size.height)
                            Rectangle()
                                .foregroundColor(self.colors[index])
                                .cornerRadius(self.radius[index])
                                .frame(height: self.height[index])
                                .animation(self.isHidden ? nil : Animation.easeInOut(duration: 1.5))
                        }
                    }
                }
            }
            .opacity(self.isHidden ? Badge.opacity : 1)
            .onAppear{
                for i in 0..<self.height.count{
                    self.height[i] = geo.size.height / (CGFloat.random(in: 2...5))
                    self.radius[i] = CGFloat.random(in: 0...10)
                }
            }
            .onReceive(self.timer) { _ in
                if !self.isHidden{
                    for i in 0..<self.height.count{
                        self.height[i] = CGFloat.random(in: 0...geo.size.height)
                        self.radius[i] = CGFloat.random(in: 0...10)
                    }
                }
            }
        }
    }
}

private struct ChartBadge_Previews: PreviewProvider {
    static var previews: some View {
        ChartBadge(isHidden: false)
            .frame(width: 200, height: 200)
    }
}
