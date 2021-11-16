//
//  ExampleList.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/19/21.
//

import SwiftUI
import RSWTools
import SFSymbols
import SwiftTools


struct ExampleList: View{
    @EnvironmentObject var iconManager: IconManager
    
    @State private var selection: Example?
    @State private var showShare = false
    @State private var showMail = false
    @State private var showSFSymbolPicker = false
    @State private var website = URL.personal
    @State private var pickedSymbol  = SFSymbol.listDash
    
    
    enum Example: Hashable {
        case safariView
        case richLink
        case photoPicker
    }
    
    var body: some View{
        List(selection: $selection){
            Section(header: Text("Navigation Views")){
                NavigationLink(
                    destination: SafariView(url: website)
                        .edgesIgnoringSafeArea(.all)
                        .navigationBarHidden(true),
                    tag: Example.safariView,
                    selection: $selection
                ) {
                    Label("Safari View", symbol: .safari)
                }
                .accessibility(label: Text("Safari View"))
                .contextMenu{
                    Button("Personal", symbol: .person){
                        website = .personal
                    }
                    Button("Swift By Sundell", symbol: .swift){
                        website = .swiftBySundell
                    }
                }
                
                NavigationLink(
                    destination: RichLinkPreviewView(),
                    tag: Example.richLink,
                    selection: $selection
                ) {
                    Label("Rich Link", symbol: .link)
                }.accessibility(label: Text("Rich Link"))
                
                if #available(iOS 15.0, *) {
                    NavigationLink(
                        destination: PhotoPickerPreview(),
                        tag: Example.photoPicker,
                        selection: $selection
                    ) {
                        Label("Photo Picker", symbol: .photo)
                    }.accessibility(label: Text("Photo Picker"))
                }
            }
            
            Section(header: Text("Sheet Views")){
                Button("Share Sheet", symbol: .share, textColor: .primary){
                    showShare.toggle()
                }
                .sheet(isPresented: $showShare){
                    ShareSheetView(items: ["This is a test"])
                }
                
                Button("Mail view", symbol: .envelope, textColor: .primary){
                    showMail.toggle()
                }
                .sheet(isPresented: $showMail){
                    MailPreview()
                }
                
                Button("SFSymbol Picker", symbol: pickedSymbol, textColor: .primary){
                    showSFSymbolPicker.toggle()
                }
                .sheet(isPresented: $showSFSymbolPicker){
                    NavigationView{
                        Form{
                            NavigationLink {
                                if #available(iOS 15.1, *) {
                                    SFSymbolPicker(symbolTitle: pickedSymbol.title){
                                        pickedSymbol = $0
                                    }
                                } else {
                                    Text("iOS 15.1 needed")
                                }
                            } label: {
                                Label("Image", symbol: pickedSymbol)
                                    .labelStyle(.coloredBadge(.accentColor))
                            }
                        }
                        .navigationBarTitle("Symbol Form")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            
            
            Section(header: Text("Icons")){
                ForEach(iconManager.supportedIcons){ icon in
                    HStack{
                        Text(icon.publicName)
                        Spacer()
                        Image(uiImage: icon.uiImage)
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 35, height: 35)
                            .cornerRadius(5)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture{
                        iconManager.setCurrentIcon(to: icon)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Examples")
    }
}

struct ExampleList_Previews: PreviewProvider {
    static let devices: [PreviewDevice] = [.iPhone8, .iPhone12]
    
    static var previews: some View {
        ForEach(devices) { device in
            NavigationView{
                ExampleList()
                    .previewDevice(device)
                    .previewDisplayName(device.rawValue)
            }
        }
    }
}
