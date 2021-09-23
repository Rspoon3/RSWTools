//
//  SettingsImageButton.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 11/2/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI

public struct SettingsImageButton: View {
    let text:  String
    let image: Image
    let color: Color?
    let size:  CGFloat
    let action: ()->()
    
    public init(_ text: String,
                image: Image, color: Color? = nil,
                size:Int = 30,
                action: @escaping ()->()){
        self.text = text
        self.image = image
        self.color = color
        self.size = CGFloat(size)
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack{
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack{
                    if let color = color{
                        color
                    }
                    image
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: size, height: size)
                }
                .frame(width: 30, height: 30)
                .cornerRadius(5)
            }
        }).foregroundColor(.primary)
    }
}

struct SettingsImageButton_Previews: PreviewProvider {
    static var previews: some View {
        Form{
            SettingsImageButton("Privacy Policy",
                                image: Image(symbol: .handRaisedFill),
                                color: .accentColor, size: 20){}
        }
    }
}
