//
//  URLRequestExtension.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 4/27/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import UIKit

public let imageCache = NSCache<AnyObject, AnyObject>()

extension URLRequest {
    
    public static func checkHTTPResponse(_ response: URLResponse?){
        if let httpResponse = response as? HTTPURLResponse {
            switch (httpResponse.statusCode) {
            case 400...499:
                print("400...499")
                return
            case 500...599:
                print("500...599")
                return
            default:
                //print(httpResponse.statusCode)
                break
            }
        }
    }
    
    public static func cacheImage(_ urlString: String, _ dispatchQoS: DispatchQoS.QoSClass, completion:  ((UIImage?) -> Void)? = nil) {
        
        //If image is already in cache then return
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            completion?(cachedImage)
            //print("Image has already been cached No url request will be performed.")
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion?(nil)
            return
        }
        
        DispatchQueue.global(qos: dispatchQoS).async{
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let error = error {
                    print(error)
                    completion?(nil)
                    return
                }
                
                URLRequest.checkHTTPResponse(response)
                
                if let data = data{
                    if let downloadedImage = UIImage(data: data) {
                        imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                        //print("Finished caching image.")
                        completion?(downloadedImage)
                    }
                }
                
            }).resume()
        }
    }
    
}
