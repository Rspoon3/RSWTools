//
//  MailPreview.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/20/21.
//

import SwiftUI
import RSWTools
import MessageUI

class MailPreviewViewModel: ObservableObject{
    @Published var alert: MultiAlert?
    @Published var result: Result<MFMailComposeResult, Error>? = nil{
        didSet{
            if let result = result{
                handleMail(with: result)
            }
        }
    }
    
    var emailMessage: String{
        let systemVersion = UIDevice.current.systemVersion
        var message = "\n\n\n\n\n\n\(UIDevice.current.systemName) Version: \(systemVersion)"
        
        if let version = Bundle.appVersion, let build = Bundle.appBuild{
            message.append("\nApp Version: \(version)(\(build))")
        }
        
        return message
    }
    
    
    //MARK: Helpers
    private func handleMail(with result: Result<MFMailComposeResult, Error>){
        switch result{
        case .success(let result):
            switch result{
            case .cancelled:
                print("Cancelled")
            case .saved:
                print("Saved")
            case .sent:
                print("Sent")
            case .failed:
                print("Failed")
            @unknown default:
                print("Unknown")
            }
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
}


struct MailPreview: View {
    @StateObject var model = MailPreviewViewModel()
    
    var body: some View {
        if MFMailComposeViewController.canSendMail(){
            MailView(recipients: ["richardwitherspoon3@gmail.com"],
                     subject: "Test Feedback From RSWTools",
                     message: "Feedback message goes here",
                     result: $model.result)
                .alert(item: $model.alert){ $0.alert }
        } else {
            Text("Can't send mail on this device.")
        }
    }
}

struct MailPreview_Previews: PreviewProvider {
    static var previews: some View {
        MailPreview()
    }
}
