//
//  Triange.swift
//  Body Insights
//
//  Created by Richard Witherspoon on 9/13/19.
//  Copyright © 2019 Resolve. All rights reserved.
//

import SwiftUI

struct Triangle: View {
      static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

     var body: some View {
         GeometryReader { geometry in
             Path { path in
                 let width = min(geometry.size.width, geometry.size.height)
                 let height = width 
                 let middle = width / 2
                 path.addLines([
                     CGPoint(x: middle, y: 0),
                     CGPoint(x: 0, y: height),
                     CGPoint(x: width, y: height),
                 ])
             }
             .fill(Self.symbolColor)
         }
     }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
    }
}
