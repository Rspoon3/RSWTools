//
//  CLAuthorizationStatus+Extension.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 4/9/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import Foundation
import CoreLocation

public extension CLAuthorizationStatus {
    var permissionStatus: PermissionStatus {
        switch self {
        case .notDetermined:
            return .idle
        case .restricted, .denied:
            return .denied
        case .authorizedAlways, .authorizedWhenInUse:
            return .allowed
        @unknown default:
            return .denied
        }
    }
}
