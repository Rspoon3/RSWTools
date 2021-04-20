//
//  CircleBadge.swift
//  
//
//  Created by Richard Witherspoon on 11/18/19.
//

import SwiftUI

public struct CircleBadge: View {
    @State private var animate = false
    private let time : Double = 3
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    var animation : Animation{
        Animation.easeInOut(duration: self.time)
            .delay(Double.random(in: 0...2))
            .repeatForever(autoreverses: true)
    }
    
    public var body: some View {
        ZStack {
            Circle().fill(Color.init(.systemGreen))
                .scaleEffect(animate ? 1 : 0)
                .animation(isHidden ? nil : animation)
            Circle().fill(Color.init(.systemYellow))
                .scaleEffect(animate ? 0.8 : 0)
                .animation(isHidden ? nil : animation)
            Circle().fill(Color.init(.systemOrange))
                .scaleEffect(animate ? 0.6 : 0)
                .animation(isHidden ? nil : animation)
            Circle().fill(Color.init(.systemRed))
                .scaleEffect(animate ? 0.4 : 0)
                .animation(isHidden ? nil : animation)
            Circle().fill(Color.init(.systemBlue))
                .scaleEffect(animate ? 0.2 : 0)
                .animation(isHidden ? nil : animation)
        }
        .opacity(isHidden ? Badge.opacity : 1)
        .onAppear{
            self.animate.toggle()
        }
    }
}

struct CircleBadge_Previews: PreviewProvider {
    static var previews: some View {
        CircleBadge(isHidden: false)
    }
}
