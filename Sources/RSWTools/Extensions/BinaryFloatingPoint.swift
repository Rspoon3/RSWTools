//
//  File.swift
//  
//
//  Created by Richard Witherspoon on 9/12/19.
//

import Foundation

extension BinaryFloatingPoint{
    public func roundToPlaces(places:Int) -> Double {
          let divisor = pow(10.0, Double(places))
          return (Double(self) * divisor).rounded() / divisor
      }
}
