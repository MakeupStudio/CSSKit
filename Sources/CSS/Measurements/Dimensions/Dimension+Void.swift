//
//  Dimension+Void.swift
//  CSS
//
//  Created by Maxim Krouk on 12/22/19.
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
