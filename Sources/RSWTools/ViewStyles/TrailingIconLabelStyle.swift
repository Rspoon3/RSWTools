//
//  TrailingIconLabelStyle.swift
//  TrailingIconLabelStyle
//
//  Created by Richard Witherspoon on 8/6/21.
//

import SwiftUI

@available(iOSApplicationExtension 14.0, *)
public struct TrailingIconLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
                .frame(maxWidth: .infinity, alignment: .leading)
            configuration.icon
        }
    }
}

@available(iOSApplicationExtension 14.0, *)
public extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: TrailingIconLabelStyle {
        get{
            TrailingIconLabelStyle()
        }
    }
}
