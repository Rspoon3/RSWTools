//
//  IconManager.swift
//  EZMaxRequest
//
//  Created by Richard Witherspoon on 11/25/20.
//  Copyright © 2020 InterPro Solutions, LLC. All rights reserved.
//

import SwiftUI

class IconManager: ObservableObject{
    @Published var currentIcon: AppIcon
    let supportedIcons = AppIcon.all
    static let shared = IconManager()
    
    private init() {
        guard
            let name = UIApplication.shared.alternateIconName,
            let icon = AppIcon.all.first(where: {$0.fileName == name})
        else {
            currentIcon = .defaultIcon
            return
        }
        
        currentIcon = icon
    }
    
    
    func setCurrentIcon(to icon: AppIcon){
        UIApplication.shared.setAlternateIconName(icon == .defaultIcon ? nil : icon.fileName){ [weak self] error in
            if error == nil{
                self?.currentIcon = icon
                NotificationCenter.default.post(name: .appIconDidChange, object: nil,
                                                userInfo: ["icon": icon])
            }
        }
    }
    
    
    //MARK: - App Icon Struct
    struct AppIcon: Identifiable, Equatable{
        let id = UUID()
        fileprivate let fileName: String
        let publicName: String
        let uiImage: UIImage
        
        //MARK: - Supported Icons
        static let defaultIcon = AppIcon(fileName: "AppIcon",
                                         publicName: "Default",
                                         uiImage: Bundle.appIcon(type: .primary))
        
        static let greenIcon = AppIcon(fileName: "GreenIcon",
                                       publicName: "Green",
                                       uiImage: Bundle.appIcon(type: .alternative(named: "GreenIcon")))
        
        
        static let orangeIcon = AppIcon(fileName: "OrangeIcon",
                                        publicName: "Orange",
                                        uiImage: Bundle.appIcon(type: .alternative(named: "OrangeIcon")))
        
        
        static let purpleIcon = AppIcon(fileName: "PurpleIcon",
                                        publicName: "Purple",
                                        uiImage: Bundle.appIcon(type: .alternative(named: "PurpleIcon")))
        
        static let all = [defaultIcon, greenIcon, orangeIcon, purpleIcon]
    }
}
