//
//  SettingsView.swift
//  InterProToolsPreview
//
//  Created by Richard Witherspoon on 9/16/21.
//

import SwiftUI
import RSWTools
import SFSymbols

struct SettingsView: View {
    @Environment(\.openURL) var openURL
    @Environment(\.presentationMode) var presentationMode
    let displayMode: NavigationBarItem.TitleDisplayMode
    
    var body: some View {
        NavigationView{
            Form{
                //MARK: - Websites
                Section(header: Text("Websites")){
                    SettingsImageButton("Personal",
                                        image: Image(symbol: .safariFill),
                                        color: .safari,
                                        size: 20){
                        openURL(.personal)
                    }
                    
                    SettingsImageButton("RSWTools",
                                        image: Image("github"),
                                        color: .black,
                                        size: 20){
                        openURL(.gitHub)
                    }
                }
                
                //MARK: - Made By
                SettingsMadeBy(appID: 1397531585)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Done"){
                                presentationMode.wrappedValue.dismiss()
                            }
                            .opacity(displayMode == .inline ? 1 : 0)
                        }
                    }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(displayMode)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(displayMode: .inline)
    }
}
