//
//  Dimension+Time.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Dimension {
    
    public struct Time: CSSDimension {
        public var value: Double
        public let unit: Unit
        
        public init(value: Double, unit: Unit = .s) {
            self.value = value
            self.unit = unit
        }
        
        /// Converts time to specified unit
        public func converted(to unit: Unit) -> Self {
            guard self.unit != unit else { return self }
            switch (self.unit, unit) {
            case (.s, .ms): return .init(value * 1000, unit)
            case (.ms, .s): return .init(value / 1000, unit)
            default:
                assertionFailure("Unimplemented convertion, consider converting manually and make a PR")
                return self
            }
        }
        
        public struct Unit: CSSUnit, ExpressibleByStringLiteral {
            public var rawValue: RawUnit
            
            public init(stringLiteral value: String) {
                self.init(rawValue: .init(stringLiteral: value))
            }
            
            public init(rawValue: RawUnit) {
                self.rawValue = rawValue
            }
            
            /// Represents a time in seconds.
            public static var s: Self { "s" }
            
            /// Represents a time in milliseconds.
            public static var ms: Self { "ms" }
        }
    }
    
}

extension Dimension.Time {
    
    /// Represents a time in seconds.
    public static func s(_ value: Double) -> Self { .init(value, .s) }
    
    /// Represents a time in milliseconds.
    public static func ms(_ value: Double) -> Self { .init(value, .ms) }
    
}
