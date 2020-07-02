//
//  AtRule+Namespace.swift
//  CSSKit
//
//  Created by Maxim Krouk on 5/29/20.
//

extension AtRules {
    public struct Namespace: CSSAtRule {
        static private var prefix: String { "@namespace" }
        public var label: Label
        public var target: Target
        
        public init?(rawValue: RawAtRule) {
            let string = rawValue.render().trimmingCharacters(in: .whitespacesAndNewlines)
            guard string.hasPrefix(Self.prefix) else { return nil }
            let noPrefix = string.components(separatedBy: .whitespaces).dropFirst()
            
            guard let labelString = noPrefix.first else { return nil }
            
            let label = Label(labelString)
            
            let targetString = noPrefix.dropFirst().joined(separator: " ")
            guard !targetString.isEmpty else { return nil }
            
            let target = Target(targetString)
            
            self.init(label: label, target: target)
        }
        
        public init(label: Label, target: Target) {
            self.label = label
            self.target = target
        }
        
        public var rawValue: RawValue {
            RawAtRule([
                Self.prefix,
                label.rawValue,
                target.rawValue
            ]
                .filter { !$0.isEmpty }
                .joined(separator: " ")
            )
        }
    }
}

extension AtRules.Namespace {
    public struct Label: RawRepresentable, ExpressibleByStringLiteral {
        private(set) public var rawValue: String
        
        public init(stringLiteral value: StringLiteralType) {
            self.init(value)
        }
        
        public init(_ value: String) {
            self.init(rawValue: value)
        }
        
        public init(rawValue: String) { self.rawValue = rawValue }
        
        static var `default`: Self { .init("") }
    }
    
    // TODO: Maybe I should validate target in initializer somehow
    public struct Target: RawRepresentable, ExpressibleByStringLiteral {
        private(set) public var rawValue: String
        
        public init(stringLiteral value: StringLiteralType) {
            self.init(value)
        }
        
        public init(_ value: String) {
            self.init(rawValue: value)
        }
        
        public init(rawValue: String) { self.rawValue = rawValue }
        
        public static func url(_ value: String) -> Self { .init("url(\(value)") }
        public static func string(_ value: String) -> Self { .init(value) }
    }
}
