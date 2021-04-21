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
    
    
    //MARK: Misc
    public static let locationViewfinder = SFSymbol("location.viewfinder")
    public static let link               = SFSymbol("link")
    public static let swift              = SFSymbol("swift")
    public static let gear               = SFSymbol("gear")
    public static let calendar           = SFSymbol("calendar")
    public static let exclamationMark    = SFSymbol("exclamationmark.square.fill")
    public static let raisedHand         = SFSymbol("hand.raised.fill")
    public static let trash              = SFSymbol("trash")
    public static let photo              = SFSymbol("photo")
    public static let wrench             = SFSymbol("wrench")

    //MARK: Person
    public static let person             = SFSymbol("person")
    public static let person2            = SFSymbol("person.2")
    public static let person3            = SFSymbol("person.3")
    public static let personFill         = SFSymbol("person.fill")
    public static let personCircle       = SFSymbol("person.circle")
    public static let personCircleFill   = SFSymbol("person.circle.fill")

    //MARK: Arrow
    public static let share              = SFSymbol("square.and.arrow.up")
    public static let refresh            = SFSymbol("arrow.clockwise")

    //MARK: Checkmark
    public static let checkmarkCircle    = SFSymbol("checkmark.circle")
    public static let checkmark          = SFSymbol("checkmark")
    
    //MARK: Safari
    public static let safariFill         = SFSymbol("safari.fill")
    public static let safari             = SFSymbol("safari")
    
    //MARK: Envelope
    public static let envelopeFill       = SFSymbol("envelope.fill")
    public static let envelope           = SFSymbol("envelope")
    
    //MARK: Doc
    public static let docText            = SFSymbol("doc.text")
    public static let copy               = SFSymbol("doc.on.doc")
    
    //MARK: Lock
    public static let unlock             = SFSymbol("lock.open")
    public static let lock               = SFSymbol("lock")
    
    //MARK: Pencil
    public static let edit               = SFSymbol("pencil.and.ellipsis.rectangle")
    public static let pencilCircle       = SFSymbol("pencil.circle")
    public static let writing            = SFSymbol("square.and.pencil")

    //MARK: Plus
    public static let plus               = SFSymbol("plus")
    public static let plusCircle         = SFSymbol("plus.circle")
    public static let plusCircleFill     = SFSymbol("plus.circle.fill")
}
