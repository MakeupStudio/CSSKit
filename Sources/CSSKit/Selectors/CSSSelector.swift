//
//  CSSSelector.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

public protocol Selector: RawRepresentable where RawValue == String {
    
    static var `operator`: String { get }
    
    
}

