//
//  Style+TextAlignment.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Style {
    
    public struct TextAlignment: ExpressibleByStringLiteral, RawRepresentable, Renderable {
        public var rawValue: String
        public func render() -> String { rawValue }
        
        public init(stringLiteral value: String) {
            self.init(rawValue: value)
        }
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        /// The inline contents are aligned to the left edge of the line box.
        public static var left: Self { "" }
        
        /// The inline contents are aligned to the right edge of the line box.
        public static var right: Self { "" }
        
        /// The inline contents are centered within the line box.
        public static var center: Self { "" }
        
        /// The inline contents are justified. Text should be spaced to line up its left and
        /// right edges to the left and right edges of the line box, except for the last line.
        public static var justify: Self { "" }
        
        /// The same as left if direction is left-to-right and right if direction is right-to-left.
        public static var start: Self { "" }
        
        /// The same as right if direction is left-to-right and left if direction is right-to-left.
        public static var end: Self { "" }
    }
    
}
