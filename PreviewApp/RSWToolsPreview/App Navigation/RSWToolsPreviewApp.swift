//
//  RSWToolsPreviewApp.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/19/21.
//

import SwiftUI

@main
struct RSWToolsPreviewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(IconManager.shared)
        }
    }
}
