//
//  AppSidebarNavigation.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/19/21.
//

import SwiftUI
import RSWTools
import SwiftTools


struct AppSidebarNavigation: View {
    @State private var showSettings = false
    
    var sidebar: some View {
        ExampleList()
        .listStyle(.sidebar)
        .sheet(isPresented: $showSettings){
            SettingsView(displayMode: .inline)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                settingsButton
            }
        }
    }
    
    var settingsButton: some View{
        Button(symbol: .gear){
            showSettings.toggle()
        }
        .accessibility(label: Text("Settings"))
    }

    
    var body: some View {
        NavigationView {
            #if os(macOS)
            sidebar
                .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            #else
            sidebar
            
            SafariView(url: .personal)
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarHidden(true)
            #endif
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
