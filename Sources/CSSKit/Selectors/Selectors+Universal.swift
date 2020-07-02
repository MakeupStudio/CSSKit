//
//  CSSDimension.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Selectors {
    public struct Universal: CSSSelector {
        static var `operator`: String { "*" }
        private(set) public var rawValue: RawSelector
        
        public init() {
            self.init(rawValue: .init(Self.operator))!
        }
        
        public init?(rawValue: RawSelector) {
            guard rawValue.render() == Self.operator else { return nil }
            self.rawValue = rawValue
        }
        
        static var all: Self { .init() }
    }
}
