//
//  Dimension+Frequency.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Dimension {
    
    public struct Frequency: CSSDimension {
        public var value: Double
        public var unit: Unit
        
        public init(value: Double, unit: Unit = .hz) {
            self.value = value
            self.unit = unit
        }
        
        /// Converts time to specified unit
        public func converted(to unit: Unit) -> Self {
            guard self.unit != unit else { return self }
            switch (self.unit, unit) {
            case (.hz, .kHz): return .init(value / 1000, unit)
            case (.kHz, .hz): return .init(value * 1000, unit)
            default:
                assertionFailure("Unimplemented convertion, consider converting manually and make a PR")
                return self
            }
        }
        
        public struct Unit: CSSUnit, ExpressibleByStringLiteral {
            public var rawValue: String
            
            public init(stringLiteral value: String) {
                self.init(rawValue: value)
            }
            
            public init(rawValue: String) {
                self.rawValue = rawValue
            }
            
            /// Represents a frequency in hertz.
            public static var hz: Self { "hz" }
            
            /// Represents a frequency in kilohertz.
            public static var kHz: Self { "kHz" }
        }
    }
    
}
