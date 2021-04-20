//
//  FlowerPetalBadge.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 11/11/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20
    
    // How wide to make each petal
    var petalWidth: Double = 100
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(petalOffset, petalWidth)
        }
        set {
            self.petalOffset = newValue.first
            self.petalWidth = newValue.second
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()
        
        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to our main path
            path.addPath(rotatedPetal)
        }
        
        // now send the main path back
        return path
    }
}


public struct FlowerBadge: View {
    @State private var animate = false
    @State private var petalOffset = 0.0
    @State private var petalWidth = 20.0
    @State private var color = Color.blue
    
    public let isHidden : Bool
    public let type = Badge.circle
    
    public init(isHidden : Bool){
        self.isHidden = isHidden
    }
    
    
    private let timer = Timer.publish(every: 1.4, on: .main, in: .common).autoconnect()
    private let colorTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    private let colors = [Color.red, Color.orange,  Color.blue,  Color.green,  Color.purple, Color.yellow]
    
    
    private func performAnimation(){
        withAnimation(Animation.easeInOut(duration: 1.5)){
            self.petalOffset = Double.random(in: -20...20)
            self.petalWidth  = Double.random(in: 0...20)
        }
    }
    
    private func performColorAnimation(){
        withAnimation(Animation.easeInOut(duration: 3)){
            self.color = self.colors.filter({$0 != self.color}).randomElement()!
        }
    }
    
    private func performRotationAnimation(){
        withAnimation(Animation.linear(duration: 20)
            .repeatForever(autoreverses: false)){
                self.animate.toggle()
        }
    }
    
    public var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(color, style: FillStyle(eoFill: true))
                .rotationEffect(.degrees(animate ? 360 : 0))
        }
        .padding(.all, 8)
        .opacity(self.isHidden ? Badge.opacity : 1)
        .onAppear {
            if !self.isHidden{
                self.performAnimation()
                //self.performRotationAnimation()
            }
        }
        .onReceive(self.timer) { _ in
            if !self.isHidden{
                self.performAnimation()
            }
        }
        .onReceive(self.colorTimer) { _ in
            if !self.isHidden{
                self.performColorAnimation()
            }
        }
    }
}



struct FlowerPetalBadge_Previews: PreviewProvider {
    static var previews: some View {
        FlowerBadge(isHidden: false)
    }
}
