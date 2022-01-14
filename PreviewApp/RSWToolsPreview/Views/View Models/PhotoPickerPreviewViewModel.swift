//
//  PhotoPickerPreviewViewModel.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 9/22/21.
//

import Foundation
import PhotosUI


@available(iOS 15.0, *)
class PhotoPickerPreviewViewModel: ObservableObject{
    @Published var showPhotoPicker = false
    @Published var images = [UIImage]()
    @Published var showSpinner = false
    let config = PHPickerConfiguration(limit: .multiple, filter: .images)
    
    
    
    //MARK: Public
    func photoPickerResults(results: [PHPickerResult]) -> Void{
        images.removeAll(keepingCapacity: true)
        loadImages(from: results)
    }

    
    //MARK: Private Helpers
    private func loadImages(from results: [PHPickerResult]){
        for provider in results.map(\.itemProvider){
            if provider.canLoadObject(ofClass: UIImage.self){
                provider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self?.images.append(image)
                        }
                    } else {
                        print(error?.localizedDescription ?? "")
                    }
                }
            } else {
                print("Cant load image")
            }
        }
    }
}
