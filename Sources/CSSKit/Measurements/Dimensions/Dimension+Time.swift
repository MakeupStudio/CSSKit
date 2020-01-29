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
            switch (self.unit, unit) {
            case (.s, .s), (.ms, .ms): return self
            case (.s, .ms): return .init(value / 1000, unit)
            case (.ms, .s): return .init(value * 1000, unit)
            }
        }
        
        public enum Unit: String, CSSUnit {
            /// Represents a time in seconds.
            case s
            
            /// Represents a time in milliseconds.
            case ms
        }
    }
    
}
