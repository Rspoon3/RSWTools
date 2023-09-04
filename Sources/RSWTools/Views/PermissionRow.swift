//
//  PermissionRow.swift
//  EZMaxRequest
//
//  Created by Richard Witherspoon on 2/8/21.
//  Copyright © 2021 InterPro Solutions, LLC. All rights reserved.
//

import SwiftUI
import SwiftTools

public struct PermissionRow: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Binding var status: PermissionStatus
    let permission: Permission
    let action: ()->Void
    
    public init(
        status: Binding<PermissionStatus>,
        permission: Permission,
        _ action: @escaping ()->Void
    ){
        _status = status
        self.permission = permission
        self.action = action
    }
    
    public var body: some View {
        AStack(isVertical: sizeCategory.isAccessibilityCategory){
            Image(symbol: permission.symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: sizeCategory.isAccessibilityCategory ? 50 : 25)
                .foregroundColor(.blue)
            VStack(alignment: .leading){
                Text(permission.title)
                Text(permission.subTitle)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
            .padding(.trailing)
            .layoutPriority(2)
            
            if !sizeCategory.isAccessibilityCategory{
                Spacer()
            }
            
            Button {
                action()
            }  label: {
                Text(status.rawValue)
                    .fontWeight(.semibold)
                    .frame(width: sizeCategory.isAccessibilityCategory ? 120 : 70)
                    .font(.body)
                    .foregroundColor(status == .idle ? .blue : .white)
                    .padding(.vertical,6)
                    .padding(.horizontal, 6)
                    .background(
                        Capsule()
                            .fill(status.backgroundColor)
                    )
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .buttonStyle(.plain)
        }
    }
}

struct PermissionRow_Previews: PreviewProvider {
    static let statusTypes = [PermissionStatus.denied]
    
    static var previews: some View {
        ForEach(ContentSizeCategory.allCases, id: \.self) { contentSize in
            ForEach(PermissionStatus.allCases, id: \.self){ status in
                PermissionRow(
                    status: .constant(status),
                    permission: .locationWhenInUse
                ){}
                    .padding()
                    .previewLayout(.sizeThatFits)
                    .previewDisplayName("\(contentSize)")
                    .environment(\.sizeCategory, contentSize)
            }
        }
    }
}
