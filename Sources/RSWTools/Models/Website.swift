//
//  Website.swift
//  
//
//  Created by Richard Witherspoon on 4/16/21.
//

import Foundation


public struct Website{
    public let urlString: String
    
    public var url: URL{
        URL(string: urlString)!
    }
    
    public init(_ urlString: String){
        self.urlString = urlString
    }
    
    public static let swiftBySundell = Website("https://www.swiftbysundell.com")
    public static let personal = Website("https://www.rspoon3.com")
    public static let apple = Website("https://www.apple.com")

    public static func twitter(username: String)-> String{
        "https://twitter.com/\(username)"
    }
    
    public static func instagram(username: String)-> String{
        "https://www.instagram.com/\(username)"
    }
    
    public static func appStoreReview(appID: Int)->URL{
        URL(string: "https://itunes.apple.com/app/appName/id\(appID)?mt=8&action=write-review")!
    }
    
    public static func openAppInAppStore(appID: Int)->URL{
        URL(string: "https://itunes.apple.com/app/appName/id\(appID)")!
    }
}
