//
//  Dimension+Length.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Dimension {
    
    public struct Length: CSSDimension, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
        public var value: Double
        public var unit: Unit
        
        public init(floatLiteral value: Double) {
            self.init(value, .void)
        }
        
        public init(integerLiteral value: Double) {
            self.init(Double(value), .void)
        }
        
        public init(value: Double, unit: Unit) {
            self.value = value
            self.unit = unit
        }
        
        public struct Unit: CSSUnit, ExpressibleByStringLiteral {
            public var rawValue: String
            
            public init(stringLiteral value: String) {
                self.init(rawValue: value)
            }
            
            public init(rawValue: String) {
                self.rawValue = rawValue
            }
            
            /// Centimeters
            public static var cm: Self { "cm" }
            
            /// Millimeters
            public static var mm: Self { "mm" }
            
            /// inches (1inch = 96px = 2.54cm)
            public static var inch: Self { "in" }
            
            /// pixels (1px = 1/96th of 1in)
            public static var px: Self { "px" }
            
            /// points (1pt = 1/72 of 1in)
            public static var pt: Self { "pt" }
            
            /// picas (1pc = 12 pt)
            public static var pc: Self { "pc" }
            
            /// Relative to the font-size of the element (2em means 2 times the size of the current font)
            ///
            /// Nice for scalable layouts
            public static var em: Self { "em" }
            
            /// Relative to the x-height of the current font (rarely used)
            public static var ex: Self { "ex" }
            
            /// Relative to width of the "0" (zero)
            public static var ch: Self { "ch" }
            
            /// Relative to font-size of the root element
            ///
            /// Nice for scalable layouts
            public static var rem: Self { "rem" }
            
            /// Relative to 1% of the width of the viewport
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            public static var vw: Self { "vw" }
            
            /// Relative to 1% of the height of the viewport
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            public static var vh: Self { "vh" }
            
            /// Relative to 1% of viewport's smaller dimension
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            public static var vmin: Self { "vmin" }
            
            /// Relative to 1% of viewport's larger dimension
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            public static var vmax: Self { "vmax" }
            
            /// Relative to the parent element
            public static var percent: Self { "%" }
            
            /// Unspecified
            public static var void: Self { "" }
        }
    }
    
}

extension Dimension.Length {
    
    /// Centimeters
    public static func cm(_ value: Double) -> Self { .init(value, .cm) }
    
    /// Millimeters
    public static func mm(_ value: Double) -> Self { .init(value, .mm) }
    
    /// inches (1inch = 96px = 2.54cm)
    public static func inch(_ value: Double) -> Self { .init(value, .inch) }
    
    /// pixels (1px = 1/96th of 1in)
    public static func px(_ value: Double) -> Self { .init(value, .px) }
    
    /// points (1pt = 1/72 of 1in)
    public static func pt(_ value: Double) -> Self { value.in.pt }
    
    /// picas (1pc = 12 pt)
    public static func pc(_ value: Double) -> Self { .init(value, .pc) }
    
    /// Relative to the font-size of the element (2em means 2 times the size of the current font)
    ///
    /// Nice for scalable layouts
    public static func em(_ value: Double) -> Self { .init(value, .em) }
    
    /// Relative to the x-height of the current font (rarely used)
    public static func ex(_ value: Double) -> Self { .init(value, .ex) }
    
    /// Relative to width of the "0" (zero)
    public static func ch(_ value: Double) -> Self { .init(value, .ch) }
    
    /// Relative to font-size of the root element
    ///
    /// Nice for scalable layouts
    public static func rem(_ value: Double) -> Self { .init(value, .rem) }
    
    /// Relative to 1% of the width of the viewport
    ///
    /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
    public static func vw(_ value: Double) -> Self { .init(value, .vw) }
    
    /// Relative to 1% of the height of the viewport
    ///
    /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
    public static func vh(_ value: Double) -> Self { .init(value, .vh) }
    
    /// Relative to 1% of viewport's smaller dimension
    ///
    /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
    public static func vmin(_ value: Double) -> Self { .init(value, .vmin) }
    
    /// Relative to 1% of viewport's larger dimension
    ///
    /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
    public static func vmax(_ value: Double) -> Self { .init(value, .vmax) }
    
    /// Relative to the parent element
    public static func percent(_ value: Double) -> Self { .init(value, .percent) }
    
    /// Unspecified
    public static func void(_ value: Double) -> Self { .init(value, .void) }
    
}
