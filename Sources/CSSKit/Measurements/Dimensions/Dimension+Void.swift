//
//  Dimension+Void.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Dimension {
    
    public struct Void: CSSDimension, ExpressibleByFloatLiteral {
        public var value: Double
        public let unit: Unit = .none
        
        public init(floatLiteral value: Double) {
            self.init(value: value)
        }
        
        public init(value: Double, unit: Unit = .none) {
            self.value = value
        }
        
        public enum Unit: CSSUnit {
            case none
            
            public init?(rawValue: RawUnit) {
                guard rawValue.render().isEmpty else { return nil }
                self = .none
            }
            
            public var rawValue: RawUnit { "" }
        }
    }
    
}
