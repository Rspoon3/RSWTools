//
//  AppTabNavigation.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/19/21.
//

import SwiftUI

struct AppTabNavigation: View {
    @State private var tabSelection = Tab.tests
    
    enum Tab {
        case tests
        case settings
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView {
                ExampleList()
                    .listStyle(InsetGroupedListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tag(Tab.tests)
            .tabItem {
                Label("Examples", systemImage: "list.number")
                    .accessibility(label: Text("Examples"))
            }
            
            SettingsView(displayMode: .large)
            .tag(Tab.settings)
            .tabItem {
                Label("Settings", symbol: .gear)
                    .accessibility(label: Text("Settings"))
            }
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
