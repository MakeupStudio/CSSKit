//
//  Numerics+Dimension.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Double {
    
    public var `in`: Dimension.Provider { .init(value: self) }
    
    public static postfix func %(_ lhs: Self) -> Dimension.Length { .init(lhs, .percent) }
    
}

extension Int {
    
    public var `in`: Dimension.Provider { .init(value: Double(self)) }
    
    public static postfix func %(_ lhs: Self) -> Dimension.Length { .init(lhs, .percent) }
    
}

extension Float {
    
    public var `in`: Dimension.Provider { .init(value: Double(self)) }
    
    public static postfix func %(_ lhs: Self) -> Dimension.Length { .init(lhs, .percent) }
    
}
