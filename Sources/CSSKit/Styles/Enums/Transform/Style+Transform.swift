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
        m11: Dimensions.Void, m12: Dimensions.Void,
        m21: Dimensions.Void, m22: Dimensions.Void,
        tX: Dimensions.Void, tY: Dimensions.Void
    ) -> Self {
        matrix(
            m11: m11, m12: m12,
            m21: m21, m22: m22,
            tX: tX, tY: tY
        )
    }
    
    public static func matrix(
        m11: Dimensions.Void, m12: Dimensions.Void,
        m21: Dimensions.Void, m22: Dimensions.Void,
        tX: Dimensions.Void, tY: Dimensions.Void
    ) -> Self {
        Style.TransformFunction(
            name: "matrix",
            arguments: erased(m11, m12, m21, m22, tX, tY)
        )
    }
    
    public static func matrix(
        m11: Dimensions.Void, m12: Dimensions.Void, m13: Dimensions.Void, m14: Dimensions.Void,
        m21: Dimensions.Void, m22: Dimensions.Void, m23: Dimensions.Void, m24: Dimensions.Void,
        m31: Dimensions.Void, m32: Dimensions.Void, m33: Dimensions.Void, m34: Dimensions.Void,
        m41: Dimensions.Void, m42: Dimensions.Void, m43: Dimensions.Void, m44: Dimensions.Void
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
    
    public static func perspective(_ value: Dimensions.Void) -> Self {
        Style.TransformFunction(name: "perspective", arguments: erased(value))
    }
    
    public static func rotate(_ angle: Dimensions.Angle) -> Self {
        Style.TransformFunction(name: "rotate", arguments: erased(angle))
    }
    
    public static func rotate(x: Dimensions.Void, y: Dimensions.Void, z: Dimensions.Void, angle: Dimensions.Angle) -> Self {
        Style.TransformFunction(
            name: "rotate3d",
            arguments: erased(x, y, z) + [angle.eraseToAnyDimension()]
        )
    }
    
    public static func rotate(x: Dimensions.Angle) -> Self {
        Style.TransformFunction(name: "rotateX", arguments: erased(x))
    }
    
    public static func rotate(y: Dimensions.Angle) -> Self {
        Style.TransformFunction(name: "rotateY", arguments: erased(y))
    }
    
    public static func rotate(z: Dimensions.Angle) -> Self {
        Style.TransformFunction(name: "rotateZ", arguments: erased(z))
    }
    
    public static func translate(x: Dimensions.Length, y: Dimensions.Length) -> Self {
        Style.TransformFunction(name: "translate", arguments: erased(x, y))
    }
    
    public static func translate3d(x: Dimensions.Length, y: Dimensions.Length, z: Dimensions.Length) -> Self {
        Style.TransformFunction(
            name: "translate3d",
            arguments: erased(x, y, z)
        )
    }
    
    public static func translate(x: Dimensions.Length) -> Self {
        Style.TransformFunction(name: "translateX", arguments: erased(x))
    }
    
    public static func translate(y: Dimensions.Length) -> Self {
        Style.TransformFunction(name: "translateY", arguments: erased(y))
    }

    public static func translate(z: Dimensions.Length) -> Self {
        Style.TransformFunction(name: "translateZ", arguments: erased(z))
    }
    
    public static func scale(x: Dimensions.Length, y: Dimensions.Length) -> Self {
        Style.TransformFunction(name: "scale", arguments: erased(x, y))
    }
    
    public static func scale(x: Dimensions.Length, y: Dimensions.Length, z: Dimensions.Length) -> Self {
        Style.TransformFunction(
            name: "scale3d",
            arguments: erased(x, y, z)
        )
    }

    public static func scale(x: Dimensions.Length) -> Self {
        .init(name: "scaleX", arguments: erased(x))
    }
    
    public static func scale(y: Dimensions.Length) -> Self {
        .init(name: "scaleY", arguments: erased(y))
    }
    
    public static func scale(z: Dimensions.Length) -> Self {
        .init(name: "scaleZ", arguments: erased(z))
    }

    public static func skew(x: Dimensions.Angle, y: Dimensions.Angle) -> Self {
        .init(name: "skew", arguments: erased(x, y))
    }
    
    public static func skew(x: Dimensions.Angle) -> Self {
        .init(name: "skewX", arguments: erased(x))
    }
    
    public static func skew(y: Dimensions.Angle) -> Self {
        .init(name: "skewY", arguments: erased(y))
    }
    
}
