//
//  Bundle+Extension.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 3/23/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI

public extension Bundle {
    static let appTitle   = main.infoDictionary?["CFBundleName"] as? String
    static let appVersion = main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let appBuild   = main.infoDictionary?["CFBundleVersion"] as? String
    
    static var appIcon: UIImage {
        guard let iconsDictionary = main.infoDictionary?["CFBundleIcons"] as? NSDictionary,
            let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? NSDictionary,
            let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? NSArray,
            // First will be smallest for the device class, last will be the largest for device class
            let lastIcon = iconFiles.lastObject as? String,
            let icon = UIImage(named: lastIcon) else {
            return UIImage(symbol: .exclamationmark)
        }

        return icon
    }
    
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
