//
//  SettingsMadeBy.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 11/2/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI

public struct SettingsMadeBy: View {
    let appID: Int
    @State private var showPersonalWebsite = false
    
    public init(appID: Int){
        self.appID = appID
    }
    
    public var body: some View {
        VStack{
            VStack{
                Image(uiImage: Bundle.appIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .cornerRadius(5)
                Text(Bundle.appTitle ?? "N/A")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemGray))
                Text("Version \(Bundle.appVersion ?? "N/A")(\(Bundle.appBuild ?? "N/A"))")
                    .foregroundColor(Color(.systemGray2))
                    .font(.caption)
                    .padding(.bottom)
            }
            .onTapGesture {
                UIApplication.shared.open(Website.openAppInAppStore(appID: appID), options: [:])
            }
            VStack{
                Text("Designed and Developed")
                Text("by ") + Text("Ricky Witherspoon")
                    .foregroundColor(.accentColor)
            }
            .foregroundColor(Color(.systemGray2))
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .center)
            .onTapGesture{
                
            }
            .sheet(isPresented: $showPersonalWebsite){
                SafariView(website: .personal)
            }
        }
        .padding(.top)
        .listRowBackground(Color(.systemGroupedBackground))
    }
}

struct SettingsMadeBy_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMadeBy(appID: 1496562731)
    }
}

