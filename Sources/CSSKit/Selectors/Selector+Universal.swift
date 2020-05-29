//
//  CSSDimension.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Selector {
    public struct Universal: CSSSelector {
        private(set) public var rawValue: RawSelector
        
        public init() {
            self.init(rawValue: "*")!
        }
        
        public init?(rawValue: RawSelector) {
            guard rawValue.render() == "*" else { return nil }
            self.rawValue = rawValue
        }
        
        static var all: Self { .init() }
    }
}
