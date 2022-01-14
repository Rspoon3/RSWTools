//
//  PhotoPickerPreview.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/19/21.
//

import SwiftUI
import RSWTools
import PhotosUI
import Combine
import SwiftTools


@available(iOS 15.0, *)
struct PhotoPickerPreview: View {
    @StateObject var model = PhotoPickerPreviewViewModel()
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()),
                                     count: 3),
                      spacing: 20){
                ForEach(model.images, id: \.self) { image in
                    if let thumbnail = image.preparingThumbnail(of: CGSize(width: 300, height: 300)){
                        GeometryReader { geo in
                            Image(uiImage: thumbnail)
                                .resizable()
                                .scaledToFill()
                                .frame(height: geo.size.width)
                        }
                        .clipped()
                        .scaledToFit()
                        .cornerRadius(8)
                        .padding(.bottom, 50)
                    }
                }
            }
                      .padding()
        }
        .navigationTitle("Photo Picker")
        .overlay{
            VStack(spacing: 15){
                Image(symbol: .exclamationmarkTriangle)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 75)
                Text("No images selected")
                    .font(.title2)
            }
            .opacity(model.images.isEmpty ? 1 : 0)
        }
        .overlay(
            ProgressView()
                .scaleEffect(1.5)
                .opacity(model.showSpinner ? 1 : 0)
        )
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(symbol: .plus){
                    model.showPhotoPicker.toggle()
                }
            }
        }
        .sheet(isPresented: $model.showPhotoPicker){
            PhotoPicker(configuration: model.config,
                        handler: model.photoPickerResults)
        }
    }
}

@available(iOS 15.0, *)
struct PhotoPickerPreview_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerPreview()
    }
}
