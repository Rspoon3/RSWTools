//
//  String+Extension.swift
//  
//
//  Created by Richard Witherspoon on 1/21/21.
//

import UIKit


public extension String{
    
    func replacingFirstOccurrenceOf(_ target: String, with replaceString: String) -> String{
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
}