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
            switch (self.unit, unit) {
            case (.hz, .hz), (.kHz, .kHz): return self
            case (.hz, .kHz): return .init(value / 1000, unit)
            case (.kHz, .hz): return .init(value * 1000, unit)
            }
        }
        
        public enum Unit: String, CaseIterable, CSSUnit {
            /// Represents a frequency in hertz.
            case hz
            
            /// Represents a frequency in kilohertz.
            case kHz
        }
    }
    
}
