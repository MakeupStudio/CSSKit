//
//  Dimension+Angle.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Dimension {
    
    public struct Angle: CSSDimension {
        public var value: Double
        public var unit: Unit
        public init(value: Double, unit: Unit) {
            self.value = value
            self.unit = unit
        }
         
        /// Represents an angle in a number of turns.
        ///
        /// One full circle is 1turn. Examples: 0turn, 0.25turn, 1.2turn.
        static func turn(_ value: Double) -> Self { value.in.turn }
        
        public struct Unit: CSSUnit, ExpressibleByStringLiteral {
            public var rawValue: String
            
            public init(stringLiteral value: String) {
                self.init(rawValue: value)
            }
            
            public init(rawValue: String) {
                self.rawValue = rawValue
            }
            
            /// Represents an angle in degrees.
            ///
            /// One full circle is 360deg. Examples: 0deg, 90deg, 14.23deg.
            static var deg: Self { "deg" }
            
            /// Represents an angle in gradians.
            ///
            /// One full circle is 400grad. Examples: 0grad, 100grad, 38.8grad.
            static var grad: Self { "grad" }
            
            /// Represents an angle in radians.
            ///
            /// One full circle is 2π radians which approximates to 6.2832rad. 1rad is 180/π degrees. Examples: 0rad, 1.0708rad, 6.2832rad.
            static var rad: Self { "rad" }
            
            /// Represents an angle in a number of turns.
            ///
            /// One full circle is 1turn. Examples: 0turn, 0.25turn, 1.2turn.
            static var turn: Self { "turn" }
        }
    }
    
}

extension Dimension.Angle {
    
    /// Represents an angle in degrees.
    ///
    /// One full circle is 360deg. Examples: 0deg, 90deg, 14.23deg.
    static func deg(_ value: Double) -> Self { .init(value, .deg) }
     
    /// Represents an angle in gradians.
    ///
    /// One full circle is 400grad. Examples: 0grad, 100grad, 38.8grad.
    static func grad(_ value: Double) -> Self { .init(value, .grad) }
    
    /// Represents an angle in radians.
    ///
    /// One full circle is 2π radians which approximates to 6.2832rad. 1rad is 180/π degrees. Examples: 0rad, 1.0708rad, 6.2832rad.
    static func rad(_ value: Double) -> Self { .init(value, .rad) }
    
}
