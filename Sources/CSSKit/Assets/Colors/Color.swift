//
//  Color.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

import Palette
import Foundation

public typealias Color = Palette.Color<RGB>

extension Color: Renderable {
    public func render() -> String { hex(uppercase: false, hashTagPrefix: true) }
    
    public func renderRGBA() -> String {
        let rgb = self.rgb
        return "rgba("
            .appending("\(rgb.red.floatByteValue),")
            .appending("\(rgb.green.floatByteValue),")
            .appending("\(rgb.blue.floatByteValue),")
            .appending("\(alpha.floatByteValue)")
            .appending(")")
    }
    
    public func renderHSLA() -> String {
        let hsb = self.hsb
        return "hsla("
            .appending("\(hsb.hue.floatByteValue),")
            .appending("\(hsb.saturation.floatByteValue),")
            .appending("\(hsb.brightness.floatByteValue),")
            .appending("\(alpha.floatByteValue)")
            .appending(")")
    }
}
