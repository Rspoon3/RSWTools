//
//  Permission.swift
//  EZMaxRequest
//
//  Created by Richard Witherspoon on 2/8/21.
//  Copyright © 2021 InterPro Solutions, LLC. All rights reserved.
//

import Foundation
import SFSymbols


public struct Permission{
    public let title: String
    public let subTitle: String
    public let symbol: SFSymbol
    
    public static let locationWhenInUse = Permission(title: "Location While In Use",
                                              subTitle: "Attaches your location to a service request.",
                                              symbol: SFSymbol.locationViewfinder)
}
