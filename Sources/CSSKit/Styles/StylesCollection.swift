//
//  StylesCollection.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

import MarkupCore

public typealias StylesCollection = [Style]

extension StylesCollection: Renderable {
    
    public func render() -> String {
        reduce(into: "") { $0 += $1.render().appending(";") }
    }
    
    public init(_ cssString: String) {
        self = cssString
            .components(separatedBy: ";")
            .compactMap(Style.init)
    }
    
}
