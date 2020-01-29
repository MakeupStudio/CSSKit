//
//  Style+TextAlignment.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Style {
    
    public static func textAlign(_ value: TextAlignment) -> Self {
        textAlign(value.rawValue)
    }
    
    public enum TextAlignment: String {
        
        /// The inline contents are aligned to the left edge of the line box.
        case left
        
        /// The inline contents are aligned to the right edge of the line box.
        case right
        
        /// The inline contents are centered within the line box.
        case center
        
        /// The inline contents are justified. Text should be spaced to line up its left and
        /// right edges to the left and right edges of the line box, except for the last line.
        case justify
        
        /// The same as left if direction is left-to-right and right if direction is right-to-left.
        case start
        
        /// The same as right if direction is left-to-right and left if direction is right-to-left.
        case end
    }
    
}
