//
//  PhotoPicker.swift
//  
//
//  Created by Richard Witherspoon on 4/16/21.
//

import SwiftUI
import PhotosUI

public struct PhotoPicker: UIViewControllerRepresentable {
    let results: (Result<UIImage, Error>) -> Void
    
    public init(_ results: @escaping (Result<UIImage, Error>)-> Void){
        self.results = results
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
    }
    
    public func makeCoordinator() -> PhotoPicker.Coordinator {
        return Coordinator(self)
    }
    
    public class Coordinator: NSObject, PHPickerViewControllerDelegate{
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let
                    provider = results.first?.itemProvider,
                  provider.canLoadObject(ofClass: UIImage.self)
            else {
                fatalError("Something went bad picking the image")
            }
            
            provider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    if let selectedImage = image as? UIImage {
                        self.parent.results(.success(selectedImage))
                    } else if let error = error{
                        self.parent.results(.failure(error))
                    }
                }
            }
        }
    }
}
