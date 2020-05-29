//
//  Selector+Namespace.swift
//  CSSKit
//
//  Created by Maxim Krouk on 5/28/20.
//

import Foundation

extension Selector {
    /// Namespace
    ///
    /// The defined namespaces can be used to restrict the `universal`, `type`, and `attribute` selectors to only select elements within that namespace.
    /// The @namespace rule is generally only useful when dealing with documents containing multiple namespaces—such as HTML5 with
    /// inline SVG or MathML, or XML that mixes multiple vocabularies.
    public struct Namespace: CSSSelector {
        public var prefix: Prefix
        public var selector: AnySelector
        
        public init(_ prefix: AtRule.Namespace.Label, _ selector: Universal) {
            self.init(.namespace(prefix), selector)
        }
        
        public init(_ prefix: Universal, _ selector: Universal) {
            self.init(.selector(prefix), selector)
        }
        
        public init(_ prefix: Prefix, _ selector: Universal) {
            self.init(prefix: prefix, selector: .init(selector))
        }
        
        init(prefix: Prefix, selector: AnySelector) {
            self.prefix = prefix
            self.selector = selector
        }
        
        public init?(rawValue: RawSelector) {
            let string = rawValue.render()
            let components = string.components(separatedBy: "|")
            
            guard let prefix: Prefix = components.first.map({
                switch $0 {
                case "*": return .selector(.all)
                default: return .namespace(.init($0))
                }
            }) else { return nil }
            
            // TODO: Replace erasure with selector detection code
            let selector = AnySelector(rawValue: .init(components.dropFirst().joined(separator: "|")))
            
            self.init(prefix: prefix, selector: selector)
        }
        
        public var rawValue: RawValue {
            RawSelector(
                prefix.render()
                    .appending("|")
                    .appending(selector.render())
            )
        }
    }
}

extension Selector.Namespace {
    public enum Prefix: Renderable {
        case namespace(AtRule.Namespace.Label)
        case selector(Selector.Universal)
        
        public func render() -> String {
            switch self {
            case let .namespace(label):
                return label.rawValue
            case let .selector(universal):
                return universal.render()
            }
        }
    }
}
