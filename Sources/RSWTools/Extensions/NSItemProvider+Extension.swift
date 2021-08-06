//
//  NSItemProvider+Extension.swift
//  NSItemProvider+Extension
//
//  Created by Richard Witherspoon on 8/6/21.
//

import Foundation


public extension NSItemProvider{
    @available(iOSApplicationExtension 15.0, *)
    func loadObject(ofClass type: NSItemProviderReading.Type) async throws -> NSItemProviderReading{
        return try await withCheckedThrowingContinuation { continuation in
            loadObject(ofClass: type) { item, error in
                if let error = error{
                    continuation.resume(throwing: error)
                } else if let item = item{
                    continuation.resume(returning: item)
                } else {
                    let error = NSError(domain: "Unknown NSItemProviderReading Error", code: -1, userInfo: [:])
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
