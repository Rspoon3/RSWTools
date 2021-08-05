//
//  URL+Extension.swift
//  
//
//  Created by Richard Witherspoon on 8/5/21.
//

import UIKit

public extension URL{
    static let swiftBySundell = URL(string: "https://www.swiftbysundell.com")!
    static let personal = URL(string: "https://www.rspoon3.com")!
    static let apple = URL(string: "https://www.apple.com")!
    static let appStorePage = URL(string: "https://apps.apple.com/us/developer/richard-witherspoon/id1397531584")!
    static let appSettings = URL(string: UIApplication.openSettingsURLString)!

    static func twitter(username: String)-> URL{
        URL(string: "https://twitter.com/\(username)")!
    }
    
    static func instagram(username: String)-> URL{
        URL(string: "https://www.instagram.com/\(username)")!
    }
    
    static func appStoreReview(appID: Int)->URL{
        URL(string: "https://itunes.apple.com/app/appName/id\(appID)?mt=8&action=write-review")!
    }
    
    static func appStore(appID: Int)->URL{
        URL(string: "https://itunes.apple.com/app/appName/id\(appID)")!
    }
}
