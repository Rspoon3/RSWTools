//
//  ContextMenuButton.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 4/7/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import SwiftUI
import SFSymbols


public struct ContextMenuButton: View {
    let title: LocalizedStringKey
    let symbol: SFSymbol
    let action: () -> Void
    
    public init(title: LocalizedStringKey, symbol: SFSymbol, action: @escaping ()->Void){
        self.title = title
        self.symbol = symbol
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Label(title, symbol: symbol)
                .imageScale(.large)
        })
    }
}
struct ContextMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuButton(title: "This is it", symbol: .checkmark){
            
        }
    }
}
