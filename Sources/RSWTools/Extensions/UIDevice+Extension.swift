//
//  UIDevice+Extension.swift
//  Study Sets
//
//  Created by Richard Witherspoon on 5/19/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import UIKit

extension UIDevice {
    var hasBottomSafeArea: Bool {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let bottom = window?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    
    var isSimulator: Bool {
         #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
}
