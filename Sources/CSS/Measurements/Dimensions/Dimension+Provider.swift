//
//  Dimension+Provider.swift
//  CSS
//
//  Created by Maxim Krouk on 12/17/19.
//

extension Dimension {
    
    public struct Provider {
        public var value: Double
        
        // MARK: - Void
        /// Unspecified
        public var void: Dimension.Void { .init(value: value) }
        
        // MARK: - Length
        // MARK: Absolute
        /// Centimeters
        public var cm: Dimension.Length { .init(value, .cm) }
        
        /// Millimeters
        public var mm: Dimension.Length { .init(value, .mm) }
        
        /// inches (1inch = 96px = 2.54cm)
        public var inch: Dimension.Length { .init(value, .inch) }
        
        /// pixels (1px = 1/96th of 1in)
        public var px: Dimension.Length { .init(value, .px) }
        
        /// points (1pt = 1/72 of 1in)
        public var pt: Dimension.Length { .init(value, .pt) }
        
        /// picas (1pc = 12 pt)
        public var pc: Dimension.Length { .init(value, .pc) }
        
        // MARK: Relative
        /// Relative to the font-size of the element (2em means 2 times the size of the current font)
        ///
        /// Nice for scalable layouts
        public var em: Dimension.Length { .init(value, .em) }
        
        /// Relative to the x-height of the current font (rarely used)
        public var ex: Dimension.Length { .init(value, .ex) }
        
        /// Relative to width of the "0" (zero)
        public var ch: Dimension.Length { .init(value, .ch) }
        
        /// Relative to font-size of the root element
        ///
        /// Nice for scalable layouts
        public var rem: Dimension.Length { .init(value, .rem) }
        
        /// Relative to 1% of the width of the viewport
        ///
        /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
        public var vw: Dimension.Length { .init(value, .vw) }
        
        /// Relative to 1% of the height of the viewport
        ///
        /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
        public var vh: Dimension.Length { .init(value, .vh) }
        
        /// Relative to 1% of viewport's smaller dimension
        ///
        /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
        public var vmin: Dimension.Length { .init(value, .vmin) }
        
        /// Relative to 1% of viewport's larger dimension
        ///
        /// Viewport = the browser window size. If the viewport is 50cm wide, 1vw = 0.5cm.
        public var vmax: Dimension.Length { .init(value, .vmax) }
        
        /// Relative to the parent element
        public var percent: Dimension.Length { .init(value, .percent) }
        
        // MARK: - Angle
        /// Represents an angle in degrees.
        ///
        /// One full circle is 360deg. Examples: 0deg, 90deg, 14.23deg.
        public var deg: Dimension.Angle { .init(value, .deg) }
        
        /// Represents an angle in gradians.
        ///
        /// One full circle is 400grad. Examples: 0grad, 100grad, 38.8grad.
        public var grad: Dimension.Angle { .init(value, .grad) }
        
        /// Represents an angle in radians.
        ///
        /// One full circle is 2π radians which approximates to 6.2832rad. 1rad is 180/π degrees. Examples: 0rad, 1.0708rad, 6.2832rad.
        public var rad: Dimension.Angle { .init(value, .rad) }
        
        /// Represents an angle in a number of turns.
        ///
        /// One full circle is 1turn. Examples: 0turn, 0.25turn, 1.2turn.
        public var turn: Dimension.Angle { .init(value, .turn) }
        
        /// Represents a time in seconds.
        public var s: Dimension.Time { .init(value, .s) }
        
        /// Represents a time in milliseconds.
        public var ms: Dimension.Time { .init(value, .ms) }
        
        /// Represents a frequency in hertz.
        public var hz: Dimension.Frequency { .init(value, .hz) }
        
        /// Represents a frequency in kilohertz.
        public var kHz: Dimension.Frequency { .init(value, .kHz) }
    }
    
}
