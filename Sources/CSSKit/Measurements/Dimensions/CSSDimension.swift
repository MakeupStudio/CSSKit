//
//  CSSDimension.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

public enum Dimensions {}

public protocol CSSDimension: Renderable, RawRepresentable where RawValue == RawDimension {
    associatedtype Unit: CSSUnit
    var value: Double { get }
    var unit: Unit { get }
    init(value: Double, unit: Unit)
}

extension CSSDimension {
    
    /// Use this to change dimensions unit
    ///
    /// Does not convert the value, but replaces the unit
    public func `in`(_ unit: Unit) -> Self { .init(value: value, unit: unit) }

    public init(_ value: Int, _ unit: Unit) {
        self.init(value: Double(value), unit: unit)
    }

    public init(_ value: Float, _ unit: Unit) {
        self.init(value: Double(value), unit: unit)
    }

    public init(_ value: Double, _ unit: Unit) {
        self.init(value: Double(value), unit: unit)
    }
    
    public init?(rawValue: RawDimension) {
        guard let unit = Unit(rawValue: rawValue.unit) else { return nil }
        self.init(value: rawValue.value, unit: unit)
    }
    
    public var rawValue: RawValue {
        .init(value: value, unit: unit.rawValue)
    }
    
    public func eraseToAnyDimension() -> AnyDimension { .init(self) }
    
    public func render() -> String { rawValue.render() }
    
}

public struct RawDimension: CSSDimension {
    
    public var value: Double
    public var unit: RawUnit
    
    public init(rawValue: RawDimension) {
        self = rawValue
    }
    
    public init(value: Double, unit: RawUnit = .void) {
        self.value = value
        self.unit = unit
    }
    
    public var rawValue: RawDimension { self }
    
    public func render() -> String { "\(value)\(unit.rawValue.render())" }
    
}

public struct AnyDimension: CSSDimension {
    public var value: Double
    public var unit: AnyUnit
    
    public init(rawValue: RawDimension) {
        self.init(rawValue)
    }
    
    public init<T: CSSDimension>(_ dimension: T) {
        self.init(value: dimension.value, unit: dimension.unit.eraseToAnyUnit())
    }
    
    public init(value: Double, unit: AnyUnit) {
        self.value = value
        self.unit = unit
    }
}
