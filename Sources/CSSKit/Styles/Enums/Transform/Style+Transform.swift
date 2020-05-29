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
        public var arguments: [AnyDimension]
        
        public init(name: String, arguments: [AnyDimension]) {
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
    
    private static func erased<T: CSSDimension>(_ values: T...) -> [AnyDimension] { values.map(AnyDimension.init) }
    
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
            arguments: erased(m11, m12, m21, m22, tX, tY)
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
            arguments: erased(
                m11, m12, m13, m14,
                m21, m22, m23, m24,
                m31, m32, m33, m34,
                m41, m42, m43, m44
            )
        )
    }
    
    public static func perspective(_ value: Dimension.Void) -> Self {
        Style.TransformFunction(name: "perspective", arguments: erased(value))
    }
    
    public static func rotate(_ angle: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotate", arguments: erased(angle))
    }
    
    public static func rotate(x: Dimension.Void, y: Dimension.Void, z: Dimension.Void, angle: Dimension.Angle) -> Self {
        Style.TransformFunction(
            name: "rotate3d",
            arguments: erased(x, y, z) + [angle.eraseToAnyDimension()]
        )
    }
    
    public static func rotate(x: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotateX", arguments: erased(x))
    }
    
    public static func rotate(y: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotateY", arguments: erased(y))
    }
    
    public static func rotate(z: Dimension.Angle) -> Self {
        Style.TransformFunction(name: "rotateZ", arguments: erased(z))
    }
    
    public static func translate(x: Dimension.Length, y: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translate", arguments: erased(x, y))
    }
    
    public static func translate3d(x: Dimension.Length, y: Dimension.Length, z: Dimension.Length) -> Self {
        Style.TransformFunction(
            name: "translate3d",
            arguments: erased(x, y, z)
        )
    }
    
    public static func translate(x: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translateX", arguments: erased(x))
    }
    
    public static func translate(y: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translateY", arguments: erased(y))
    }

    public static func translate(z: Dimension.Length) -> Self {
        Style.TransformFunction(name: "translateZ", arguments: erased(z))
    }
    
    public static func scale(x: Dimension.Length, y: Dimension.Length) -> Self {
        Style.TransformFunction(name: "scale", arguments: erased(x, y))
    }
    
    public static func scale(x: Dimension.Length, y: Dimension.Length, z: Dimension.Length) -> Self {
        Style.TransformFunction(
            name: "scale3d",
            arguments: erased(x, y, z)
        )
    }

    public static func scale(x: Dimension.Length) -> Self {
        .init(name: "scaleX", arguments: erased(x))
    }
    
    public static func scale(y: Dimension.Length) -> Self {
        .init(name: "scaleY", arguments: erased(y))
    }
    
    public static func scale(z: Dimension.Length) -> Self {
        .init(name: "scaleZ", arguments: erased(z))
    }

    public static func skew(x: Dimension.Angle, y: Dimension.Angle) -> Self {
        .init(name: "skew", arguments: erased(x, y))
    }
    
    public static func skew(x: Dimension.Angle) -> Self {
        .init(name: "skewX", arguments: erased(x))
    }
    
    public static func skew(y: Dimension.Angle) -> Self {
        .init(name: "skewY", arguments: erased(y))
    }
    
}
