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
    let recipients: [String]
    let subject: String
    let message: String
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    
    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        public func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation, result: $result)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(recipients)
        vc.setSubject(subject)
        vc.setMessageBody(message, isHTML: false)
        return vc
    }
    
    public func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
    }
}


struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        MailView(recipients: ["richardwitherspoon3@gmail.com"],
                 subject: "Feedback",
                 message: "This is a test",
                 result: .constant(nil))
    }
}
