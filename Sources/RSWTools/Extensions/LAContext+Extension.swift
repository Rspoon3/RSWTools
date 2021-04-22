//
//  LAContext+Extension.swift
//  EZMaxRequest
//
//  Created by Richard Witherspoon on 9/22/20.
//  Copyright © 2020 InterPro Solutions, LLC. All rights reserved.
//

import Foundation
import LocalAuthentication

extension LAContext {
    enum BiometricType: String {
        case none, touchID, faceID, unknown, cantEvaluate
    }
    
    var biometricType: BiometricType {
        
        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) else {
            return .cantEvaluate
        }
        
        switch self.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        @unknown default:
            return .unknown
        }
    }
}
