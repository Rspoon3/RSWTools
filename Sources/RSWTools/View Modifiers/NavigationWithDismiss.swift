//
//  NavigationWithDismiss.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 8/26/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
public struct NavigationWithDismiss: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    public func body(content: Content) -> some View {
        NavigationView{
            content
                .toolbar(content: {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss"){
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                })
        }
    }
}
