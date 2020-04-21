//
//  CSSDimension.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

public enum Dimension {
    public typealias Erased = ErasedCSSDimension
}

public protocol CSSDimension: Erasable, Renderable where Erased == ErasedCSSDimension {
    
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
    
    public var erased: Erased { .init(self) }
    public func render() -> String { "\(value)\(unit.rawValue)" }

}

public struct ErasedCSSDimension: CSSDimension {
    
    public var value: Double
    public var unit: ErasedCSSUnit
    
    public init<T: CSSDimension>(_ dimension: T) {
        self.init(value: dimension.value, unit: dimension.unit.erased)
    }
    
    public init(value: Double, unit: ErasedCSSUnit) {
        self.value = value
        self.unit = unit
    }
    
    public init(_ value: Double) {
        self.init(value: value, unit: .void)
    }
    
}

//
//extension Dimension: Renderable, StringInitializable {
//
//    public func render() -> String { "\(value)\(unit.rawValue)" }
//
//    public init?(_ rawValue: String) {
//        var rawValue = rawValue
//        func parse(int value: inout String, from string: inout String) {
//            while let char = string.first, char.isNumber {
//                value.append(char)
//                string.removeFirst()
//            }
//        }
//        func parse(double value: inout String, from string: inout String) {
//            parse(int: &value, from: &string)
//            if rawValue.first == "." {
//                value.append(".")
//                parse(int: &value, from: &string)
//            }
//        }
//
//        var double = ""
//        parse(double: &double, from: &rawValue)
//
//        guard let value = Double(double)
//        else { return nil }
//
//        guard let unit = T(rawValue: rawValue)
//        else { return nil }
//
//        self.unit = unit
//        self.value = value
//    }
//
//}
//
//extension Dimension: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral where T == ErasedUnit {
//
//    public init(floatLiteral value: Double) {
//        self.init(value, .void)
//    }
//
//    public init(integerLiteral value: Int) {
//        self.init(value, .void)
//    }
//
//}
