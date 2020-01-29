//
//  Dimension+Void.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Dimension {
    
    public struct Void: CSSDimension {
        public var value: Double
        public let unit: Unit = .none
        public init(value: Double, unit: Unit = .none) {
            self.value = value
        }
        
        public enum Unit: String, CSSUnit {
            case none = ""
        }
    }
    
}
