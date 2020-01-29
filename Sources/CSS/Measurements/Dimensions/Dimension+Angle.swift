//
//  DimensionUnit+Angle.swift
//  CSS
//
//  Created by Maxim Krouk on 12/22/19.
//

extension Dimension {
    
    public struct Angle: CSSDimension {
        public var value: Double
        public var unit: Unit
        public init(value: Double, unit: Unit) {
            self.value = value
            self.unit = unit
        }
        
        public enum Unit: String, CaseIterable, CSSUnit {
            /// Represents an angle in degrees.
            ///
            /// One full circle is 360deg. Examples: 0deg, 90deg, 14.23deg.
            case deg
            
            /// Represents an angle in gradians.
            ///
            /// One full circle is 400grad. Examples: 0grad, 100grad, 38.8grad.
            case grad
            
            /// Represents an angle in radians.
            ///
            /// One full circle is 2π radians which approximates to 6.2832rad. 1rad is 180/π degrees. Examples: 0rad, 1.0708rad, 6.2832rad.
            case rad
            
            /// Represents an angle in a number of turns.
            ///
            /// One full circle is 1turn. Examples: 0turn, 0.25turn, 1.2turn.
            case turn
        }
    }
    
}
