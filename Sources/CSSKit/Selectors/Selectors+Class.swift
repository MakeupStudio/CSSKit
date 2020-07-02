//
//  Selectors+Tag.swift
//  CSSKit
//
//  Created by Maxim Krouk on 5/29/20.
//

extension Selectors {
    public struct Class: CSSSelector {
        public static var prefix: String { "." }
        public var name: Name
        
        public init?(rawValue: RawSelector) {
            let string = rawValue.render().trimmingCharacters(in: .whitespacesAndNewlines)
            guard string.hasPrefix(Self.prefix) else { return nil }
            self.name = Name(String(string.dropFirst(Self.prefix.count)))
        }
        
        public var rawValue: RawValue {
            RawSelector(Self.prefix.appending(name.rawValue))
        }
    }
}

extension Selectors.Class {
    public struct Name: RawRepresentable, ExpressibleByStringLiteral {
        private(set) public var rawValue: String
        
        public init(stringLiteral value: StringLiteralType) {
            self.init(value)
        }
        
        public init(_ value: String) {
            self.init(rawValue: value)
        }
        
        public init(rawValue: String) { self.rawValue = rawValue }
    }
}
