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
        "rgba("
            .appending("\(red.byteValue),")
            .appending("\(green.byteValue),")
            .appending("\(blue.byteValue),")
            .appending("\(alpha.byteValue)")
            .appending(")")
    }
    
    public func renderHSLA() -> String {
        let hsb = self.hsb
        return "hsla("
            .appending("\(hsb.hue.byteValue),")
            .appending("\(hsb.saturation.byteValue),")
            .appending("\(hsb.brightness.byteValue),")
            .appending("\(alpha.byteValue)")
            .appending(")")
    }
}
