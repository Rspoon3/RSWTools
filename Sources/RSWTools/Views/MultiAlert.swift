//
//  MultiAlert.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 8/19/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI
import CoreData

public enum MultiAlert: Identifiable {
    case nonActionable(title: String, message: String, cancelAction: (()->Void)? = nil)
    case nonActionableError(_ error: Error, completion: (()->Void)? = nil)
    case permissionDenied
    case singleAction(alert: Alert)
    
    public var id: String{
        switch self {
        case .nonActionable:
            return "nonActionable"
        case .nonActionableError:
            return "nonActionableError"
        case .permissionDenied:
            return "permissionDenied"
        case .singleAction:
            return "singleAction"
        }
    }
    
    public var alert: Alert {
        switch self {
        case .nonActionable(let title, let message, let action):
            return Alert(title: Text(title), message: Text(message), dismissButton: .cancel{
                action?()
            })
        case .nonActionableError(let error, let completion):
            return Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .cancel{
                completion?()
            })
        case .permissionDenied:
            return Alert(title: Text("Permission Denied"),
                         message: Text("This permission is denied. Would you like to change this in the settings app?"),
                         primaryButton: .default(Text("Yes"), action: UIApplication.shared.openSettingsDotApp), secondaryButton: .cancel(Text("No")))
        case .singleAction(let alert):
            return alert
        }
    }
}
