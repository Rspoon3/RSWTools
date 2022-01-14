//
//  RichLinkPreviewView.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/19/21.
//

import SwiftUI
import RSWTools
import LinkPresentation
import SwiftTools


struct RichLinkPreviewView: View {
    @State private var richLink: RichLink?
    let provider = LPMetadataProvider()
    
    var body: some View {
        Group{
            if let link = richLink{
                RichLinkView(richLink: link)
                    .scaledToFit()
                    .frame(height: 150)
            } else {
                ProgressView("Loading")
            }
        }
        .onAppear{
            provider.startFetchingMetadata(for: .swiftBySundell) { (metaData, _) in
                guard let metaData = metaData else { return }
                richLink = RichLink(for: metaData)
            }
        }
    }
}

struct RichLinkPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        RichLinkPreviewView()
    }
}
