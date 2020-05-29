//
//  CSSUnit.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

public protocol CSSUnit: Renderable, Equatable, RawRepresentable
where RawValue == RawUnit {}

extension CSSUnit {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.render() == rhs.render()
    }
    
    public func render() -> String { rawValue.render() }
    
    public func eraseToAnyUnit() -> AnyUnit { .init(self) }
}

public struct RawUnit: CSSUnit, ExpressibleByStringLiteral {
    private var _rawValue: String
    
    public init(rawValue: RawUnit) {
        self = rawValue
    }
    
    public init(stringLiteral value: String) {
        self.init(value)
    }
    
    public init(_ value: String) {
        self._rawValue = value
    }
    
    public func render() -> String { _rawValue }
    
    public var erased: AnyUnit { .init(self) }
    
    public var rawValue: Self { self }
    
    public static var void: Self { "" }
    
}

public struct AnyUnit: CSSUnit {
    private var _render: () -> String
    
    public init(rawValue: RawUnit) {
        self.init(rawValue)
    }
    
    public init<T: CSSUnit>(_ unit: T) {
        self._render = unit.render
    }
    
    public var rawValue: RawUnit { .init(render()) }
    
    public func render() -> String { _render() }
}
