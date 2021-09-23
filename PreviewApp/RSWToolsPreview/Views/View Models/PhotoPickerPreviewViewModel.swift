//
//  PhotoPickerPreviewViewModel.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 9/22/21.
//

import Foundation
import PhotosUI
import Combine

@available(iOS 15.0, *)
class PhotoPickerPreviewViewModel: ObservableObject{
    @Published var showPhotoPicker = false
    @Published var photoPickerResults = [PHPickerResult]()
    @Published var images = [UIImage]()
    @Published var showSpinner = false
    var config = PHPickerConfiguration()
    private var subscriptions = Set<AnyCancellable>()
    
    init(){
        config.selectionLimit = 0
        config.filter = .images
        
        configureResultsHandler()
    }

    
    //MARK: Private Helpers
    private func configureResultsHandler(){
        $photoPickerResults
            .sink {[weak self] results in
                print("Received \(results.count) results")
                guard let self = self else { fatalError() }
                self.images.removeAll(keepingCapacity: true)
                self.loadImages(from: results)
            }.store(in: &subscriptions)
    }
    
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
