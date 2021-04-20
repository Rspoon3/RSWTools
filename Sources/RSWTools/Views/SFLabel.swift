//
//  SFLabel.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 8/3/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI

public struct SFLabel: View {
    private let title: String
    private let symbol: SFSymbol
    private let color: Color?
    
    public init(_ title: String, _ symbol: SFSymbol, color: Color? = .accentColor){
        self.title  = title
        self.symbol = symbol
        self.color  = color
    }
    
    public var body: some View {
        Label(title, systemImage: symbol.title)
            .foregroundColor(color)
    }
}

struct SFLabel_Previews: PreviewProvider {
    static var previews: some View {
        SFLabel("test", .refresh, color: .red)
    }
}
