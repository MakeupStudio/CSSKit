//
//  Selector+Namespace.swift
//  CSSKit
//
//  Created by Maxim Krouk on 5/28/20.
//

import Foundation

extension Selectors {
    /// Namespace
    ///
    /// The defined namespaces can be used to restrict the `universal`, `type`, and `attribute` selectors to only select elements within that namespace.
    /// The @namespace rule is generally only useful when dealing with documents containing multiple namespaces—such as HTML5 with
    /// inline SVG or MathML, or XML that mixes multiple vocabularies.
    public struct Namespace: CSSSelector {
        public static var `operator`: String { "|" }
        public var prefix: Prefix
        public var selector: AnySelector
        
        public init(_ prefix: AtRules.Namespace.Label, _ selector: Universal) {
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
            let components = string.components(separatedBy: Self.operator)
            
            guard let prefix: Prefix = components.first.map({
                switch $0 {
                case Universal.operator: return .selector(.all)
                default: return .namespace(.init($0))
                }
            }) else { return nil }
            
            // TODO: Replace erasure with selector detection code
            let selector = AnySelector(rawValue: .init(components.dropFirst().joined(separator: Self.operator)))
            
            self.init(prefix: prefix, selector: selector)
        }
        
        public var rawValue: RawValue {
            RawSelector(
                prefix.render()
                    .appending(Self.operator)
                    .appending(selector.render())
            )
        }
    }
}

extension Selectors.Namespace {
    public enum Prefix: Renderable {
        case namespace(AtRules.Namespace.Label)
        case selector(Selectors.Universal)
        
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
