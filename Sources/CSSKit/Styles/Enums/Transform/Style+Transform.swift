//
//  Style+Transform.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Style {
    
    public struct TransformFunction: Renderable {
        public var name: String
        public var arguments: [Dimension.Erased]
        
        public init(name: String, arguments: [Dimension.Erased]) {
            self.name = name
            self.arguments = arguments
        }
        
        public func render() -> String {
            name.appending("(")
                .appending(renderArguments())
                .appending(")")
        }
        
        private func renderArguments() -> String {
            arguments.map { $0.render() }.joined(separator: ", ")
        }
    }
    
}

extension Style.TransformFunction {
    
    public static func affine(
        m11: Dimension.Void, m12: Dimension.Void,
        m21: Dimension.Void, m22: Dimension.Void,
        tX: Dimension.Void, tY: Dimension.Void
    ) -> Self {
        matrix(
            m11: m11, m12: m12,
            m21: m21, m22: m22,
            tX: tX, tY: tY
        )
    }
    
    public static func matrix(
        m11: Dimension.Void, m12: Dimension.Void,
        m21: Dimension.Void, m22: Dimension.Void,
        tX: Dimension.Void, tY: Dimension.Void
    ) -> Self {
        Style.TransformFunction(
            name: "matrix",
            arguments: [
                m11.erased, m12.erased,
                m21.erased,m22.erased,
                tX.erased, tY.erased
            ]
        )
    }
    
    public static func matrix(
        m11: Dimension.Void, m12: Dimension.Void, m13: Dimension.Void, m14: Dimension.Void,
        m21: Dimension.Void, m22: Dimension.Void, m23: Dimension.Void, m24: Dimension.Void,
        m31: Dimension.Void, m32: Dimension.Void, m33: Dimension.Void, m34: Dimension.Void,
        m41: Dimension.Void, m42: Dimension.Void, m43: Dimension.Void, m44: Dimension.Void
    ) -> Self {
        Style.TransformFunction(
            name: "matrix3d",
            arguments: [
                m11.erased, m12.erased, m13.erased, m14.erased,
                m21.erased, m22.erased, m23.erased, m24.erased,
                m31.erased, m32.erased, m33.erased, m34.erased,
                m41.erased, m42.erased, m43.erased, m44.erased
            ]
        )
    }
    
    public static func perspective(_ value: Dimension.Void) -> Self {
        Style.TransformFunction(name: "perspective", arguments: [value.erased])
    }
    
    public static func rotate(_ angle: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotate", arguments: [angle.erased])
    }
    
    public static func rotate(x: Dimension.Void, y: Dimension.Void, z: Dimension.Void, angle: Dimension.Angle) -> Self {
        Style.TransformFunction(
            name: "rotate3d",
            arguments: [
                x.erased,
                y.erased,
                z.erased,
                angle.erased
            ]
        )
    }
    
    public static func rotate(x: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotateX", arguments: [x.erased])
    }
    
    public static func rotate(y: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotateY", arguments: [y.erased])
    }
    
    public static func rotate(z: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotateZ", arguments: [z.erased])
    }
    
    public static func translate(x: Dimension.Length, y: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translate", arguments: [x.erased, y.erased])
    }
    
    public static func translate3d(x: Dimension.Length, y: Dimension.Length, z: Dimension.Length) -> Self {
        Style.TransformFunction(
            name: "translate3d",
            arguments: [
                x.erased,
                y.erased,
                z.erased
            ]
        )
    }
    
    public static func translate(x: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translateX", arguments: [x.erased])
    }
    
    public static func translate(y: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translateY", arguments: [y.erased])
    }

    public static func translate(z: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translateZ", arguments: [z.erased])
    }
    
    public static func scale(x: Dimension.Length, y: Dimension.Length) -> Self {
        Style.TransformFunction(name: "scale", arguments: [x.erased, y.erased])
    }
    
    public static func scale(x: Dimension.Length, y: Dimension.Length, z: Dimension.Length) -> Self {
        Style.TransformFunction(
            name: "scale3d",
            arguments: [
                x.erased,
                y.erased,
                z.erased
            ]
        )
    }

    public static func scale(x: Dimension.Length) -> Self {
        .init(name: "scaleX", arguments: [x.erased])
    }
    
    public static func scale(y: Dimension.Length) -> Self {
        .init(name: "scaleY", arguments: [y.erased])
    }
    
    public static func scale(z: Dimension.Length) -> Self {
        .init(name: "scaleZ", arguments: [z.erased])
    }

    public static func skew(x: Dimension.Angle, y: Dimension.Angle) -> Self {
        .init(name: "skew", arguments: [x.erased, y.erased])
    }
    
    public static func skew(x: Dimension.Angle) -> Self {
        .init(name: "skewX", arguments: [x.erased])
    }
    
    public static func skew(y: Dimension.Angle) -> Self {
        .init(name: "skewY", arguments: [y.erased])
    }
    
}
