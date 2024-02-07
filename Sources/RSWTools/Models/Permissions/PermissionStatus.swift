//
//  PermissionStatus.swift
//  
//
//  Created by Richard Witherspoon on 4/16/21.
//

import SwiftUI

public enum PermissionStatus: String, CaseIterable {
    case idle    = "Allow"
    case allowed = "Allowed"
    case denied  = "Denied"
    
    public var backgroundColor: Color { 
        switch self {
        case .allowed:
            return Color.blue
        case .idle:
            return Color(.systemGray6)
        case .denied:
            return Color.red
        }
    }
}
