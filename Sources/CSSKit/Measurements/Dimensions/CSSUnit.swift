//
//  CSSUnit.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

import MarkupCore

public protocol CSSUnit: RawRepresentable, ErasableType
where RawValue == String, Erased == ErasedUnit {}

extension CSSUnit {
    public var erased: Erased { .init(rawValue: rawValue) }
}

public struct ErasedUnit: CSSUnit {
    
    public var rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    public var erased: Self { self }
    
    static var void: Self { .init(rawValue: "") }
    
}
