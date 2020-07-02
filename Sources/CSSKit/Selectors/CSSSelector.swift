//
//  CSSSelector.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

public enum Selectors {}

public protocol CSSSelector: Renderable, RawRepresentable where RawValue == RawSelector {}

extension CSSSelector {
    func eraseToAnySelector() -> AnySelector { .init(self) }
    
    public func render() -> String { rawValue.render() }
}

public struct RawSelector: CSSSelector, ExpressibleByStringLiteral {
    public var _rawValue: String
    
    public init(rawValue: RawSelector) {
        self = rawValue
    }
    
    public init(stringLiteral value: String) {
        self.init(value)
    }
    
    public init(_ value: String) {
        self._rawValue = value
    }
    
    public func render() -> String { _rawValue }
    
    public var rawValue: RawSelector { self }
}

public struct AnySelector: CSSSelector {
    var _render: () -> String
    
    public init(rawValue: RawSelector) {
        self.init(rawValue)
    }
    
    public init<T: CSSSelector>(_ selector: T) {
        self._render = selector.render
    }
    
    public var rawValue: RawSelector { .init(render())}
    
    public func render() -> String { _render() }
}
