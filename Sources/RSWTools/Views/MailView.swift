//
//  MailView.swift
//  Study Sets
//
//  Created by Richard Witherspoon on 7/28/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI
import MessageUI

public struct MailView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentation
    let result: (Result<MFMailComposeResult, Error>)->Void
    
    public init(_ result: @escaping (Result<MFMailComposeResult, Error>)->Void){
        self.result = result
    }
    
    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailView
        
        init(_ parent: MailView){
            self.parent = parent
        }
        
        public func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                parent.presentation.wrappedValue.dismiss()
            }
            
            if let error = error{
                self.parent.result(.failure(error))
            }
            
            self.parent.result(.success(result))
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        
        
        let systemVersion = UIDevice.current.systemVersion
        var message = "\n\n\n\n\n\n\n\n\n\nOS Version: \(systemVersion)"

        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
           let build = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String{
            message.append("\nApp Version: \(version)(\(build))")
        }
        
        vc.setToRecipients(["Apple.Developer@nyab.com"])
        vc.setSubject("NYAB Field Service Feedback")
        vc.setMessageBody(message, isHTML: false)
        return vc
    }
    
    public func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
    }
}


struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        MailView{ _ in }
    }
}
