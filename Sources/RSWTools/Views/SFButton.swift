//
//  SFButton.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 8/16/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI

public struct SFButton: View {
    private let title: String?
    private let symbol: SFSymbol
    private let color: Color?
    private let action: ()->Void
    
    
    public init(_ title: String?, _ symbol: SFSymbol, color: Color? = nil, _ action: @escaping ()->Void){
        self.title = title
        self.symbol = symbol
        self.color = color
        self.action = action
    }
    
    public var body: some View {
        Button(action: action, label: {
            if let title = title{
                SFLabel(title, symbol, color: color)
            } else {
                symbol.image
                    .foregroundColor(color)
            }
        })
    }
}

struct SFButton_Previews: PreviewProvider {
    static var previews: some View {
        SFButton("Share", .share){}
    }
}
