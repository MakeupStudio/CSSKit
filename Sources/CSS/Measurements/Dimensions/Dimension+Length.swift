//
//  Dimension+Length.swift
//  CSS
//
//  Created by Maxim Krouk on 12/22/19.
//

extension Dimension {
    
    public struct Length: CSSDimension {
        public var value: Double
        public var unit: Unit
        public init(value: Double, unit: Unit) {
            self.value = value
            self.unit = unit
        }
        
        public enum Unit: String, CaseIterable, CSSUnit {
            /// Centimeters
            case cm
            
            /// Millimeters
            case mm
            
            /// inches (1inch = 96px = 2.54cm)
            case inch = "in"
            
            /// pixels (1px = 1/96th of 1in)
            case px
            
            /// points (1pt = 1/72 of 1in)
            case pt
            
            /// picas (1pc = 12 pt)
            case pc
            
            /// Relative to the font-size of the element (2em means 2 times the size of the current font)
            ///
            /// Nice for scalable layouts
            case em
            
            /// Relative to the x-height of the current font (rarely used)
            case ex
            
            /// Relative to width of the "0" (zero)
            case ch
            
            /// Relative to font-size of the root element
            ///
            /// Nice for scalable layouts
            case rem
            
            /// Relative to 1% of the width of the viewport
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            case vw
            
            /// Relative to 1% of the height of the viewport
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            case vh
            
            /// Relative to 1% of viewport's smaller dimension
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            case vmin
            
            /// Relative to 1% of viewport's larger dimension
            ///
            /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
            case vmax
            
            /// Relative to the parent element
            case percent = "%"
            
            /// Unspecified
            case void = ""
        }
    }
    
}
