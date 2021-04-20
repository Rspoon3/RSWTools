//
//  SFSymbol.swift
//  
//
//  Created by Richard Witherspoon on 4/16/21.
//

import SwiftUI

public struct SFSymbol {
    public let title: String
    
    public var image: Image{
        Image(systemName: title)
    }
    
    public var uiImage: UIImage{
        UIImage(systemName: title)!
    }
    
    public init(_ title: String){
        self.title = title
    }
    
    public static let photo              = SFSymbol("photo")
    public static let share              = SFSymbol("square.and.arrow.up")
    public static let refresh            = SFSymbol("arrow.clockwise")
    public static let person             = SFSymbol("person")
    public static let wrench             = SFSymbol("wrench")
    public static let checkmarkCircle    = SFSymbol("checkmark.circle")
    public static let checkmark          = SFSymbol("checkmark")
    public static let docText            = SFSymbol("doc.text")
    public static let gear               = SFSymbol("gear")
    public static let calendar           = SFSymbol("calendar")
    public static let pencilCircle       = SFSymbol("pencil.circle")
    public static let exclamationMark    = SFSymbol("exclamationmark.square.fill")
    public static let writing            = SFSymbol("square.and.pencil")
    public static let safariFill         = SFSymbol("safari.fill")
    public static let safari             = SFSymbol("safari")
    public static let raisedHand         = SFSymbol("hand.raised.fill")
    public static let trash              = SFSymbol("trash")
    public static let envelopeFill       = SFSymbol("envelope.fill")
    public static let envelope           = SFSymbol("envelope")
    public static let copy               = SFSymbol("doc.on.doc")
    public static let unlock             = SFSymbol("lock.open")
    public static let lock               = SFSymbol("lock")
    public static let locationViewfinder = SFSymbol("location.viewfinder")
    public static let link               = SFSymbol("link")
    public static let swift              = SFSymbol("swift")
}
