//
//  SafariView.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 8/19/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI
import SafariServices


public struct SafariView: UIViewControllerRepresentable {
    private let url: URL
    @Environment(\.presentationMode) var presentationMode
    
    public init(urlString: String){
        url = URL(string: urlString)!
    }
    
    public init(website: Website){
        url = website.url
    }
    
    public init(url: URL){
        self.url = url
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let vc =  SFSafariViewController(url: url)
        vc.delegate = context.coordinator
        
        return vc
    }
    
    public func updateUIViewController(_ uiViewController: SFSafariViewController,
                                       context: UIViewControllerRepresentableContext<SafariView>) {
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    public class Coordinator: NSObject, SFSafariViewControllerDelegate {
        let parent: SafariView
        
        init(_ parent: SafariView) {
            self.parent = parent
        }
        
        public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(website: .personal)
    }
}
