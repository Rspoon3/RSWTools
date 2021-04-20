//
//  PulsingStarBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/2/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

public struct PulsingStarBadge: View {
    @State var scale : CGFloat = 1
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    private var animation : Animation{
        Animation.easeInOut(duration: 1).repeatForever(autoreverses: false)
    }
    
    public var body: some View {
        GeometryReader{ geo in
            Image(systemName: "star.fill")
                .resizable()
                .frame(maxWidth : geo.size.height / 2, maxHeight:  geo.size.height / 2)
                .foregroundColor(Color.yellow)
                .overlay(
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .scaleEffect(self.scale)
                        .opacity(self.isHidden ? 0.5 : Double(2-self.scale))
                        .animation(self.isHidden ? nil : self.animation)
                        .onAppear{
                            self.scale = 2
                    }
            )
                .opacity(self.isHidden ? Badge.opacity : 1)
        }
    }
}

struct PulsingStarBadge_Previews: PreviewProvider {
    static var previews: some View {
        PulsingStarBadge(isHidden: false)
    }
}
