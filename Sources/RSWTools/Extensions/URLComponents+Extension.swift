//
//  URLComponents+Extension.swift
//  
//
//  Created by Richard Witherspoon on 1/21/21.
//

import Foundation

extension URLComponents{
    public init?(string: String, queryItems: [URLQueryItem]?){
        self.init(string: string)
        self.path = path
        self.queryItems = queryItems
    }
}
