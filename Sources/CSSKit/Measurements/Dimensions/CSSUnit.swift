//
//  CSSUnit.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

public protocol CSSUnit: RawRepresentable, Erasable, Equatable
where RawValue == String, Erased == ErasedCSSUnit {}

extension CSSUnit {
    public var erased: Erased { .init(rawValue: rawValue) }
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

public struct ErasedCSSUnit: CSSUnit, ExpressibleByStringLiteral {
    
    public var rawValue: String
    
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public var erased: Self { self }
    
    public static var void: Self { "" }
    
}
