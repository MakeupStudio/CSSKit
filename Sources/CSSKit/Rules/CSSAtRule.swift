//
//  CSSAtRule.swift
//  CSSKit
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

public enum AtRule {}

public protocol CSSAtRule: Renderable, RawRepresentable where RawValue == RawAtRule {}

extension CSSAtRule {
    public func eraseToAnyAtRule() -> AnyAtRule { .init(self) }
    
    public func render() -> String { rawValue.render() }
}

public struct RawAtRule: CSSAtRule, ExpressibleByStringLiteral {
    private var _rawValue: String

    public init(rawValue: RawAtRule) {
        self = rawValue
    }

    public init(stringLiteral value: String) {
        self.init(value)
    }

    public init(_ value: String) {
        self._rawValue = value
    }
    
    public func render() -> String { _rawValue }
    
    public var rawValue: RawAtRule { self }
    
}

public struct AnyAtRule: CSSAtRule {
    private var _render: () -> String
    
    public init(rawValue: RawAtRule) {
        self.init(rawValue)
    }
    
    public init<T: CSSAtRule>(_ rule: T) {
        self._render = rule.render
    }
    
    public var rawValue: RawAtRule { .init(render()) }
    
    public func render() -> String { _render() }
}
