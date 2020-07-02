//
//  Selectors+Tag.swift
//  CSSKit
//
//  Created by Maxim Krouk on 5/29/20.
//

extension Selectors {
    public struct Tag: CSSSelector {
        public var name: Name
        
        public init?(rawValue: RawSelector) {
            self.name = Name(rawValue.render())
        }
        
        public var rawValue: RawValue {
            RawSelector(name.rawValue)
        }
    }
}

extension Selectors.Tag {
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
