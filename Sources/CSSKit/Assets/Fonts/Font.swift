//
//  WebFont.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Font.Weight: Renderable {
    public func render() -> String { .init(rawValue) }
}

extension Font.Name: Renderable {
    public func render() -> String { rawValue }
}

public extension Font {
    
    enum Weight: ExpressibleByIntegerLiteral, Comparable {
        /// Value: 100
        case thin
        /// Value: 200
        case extraLight
        /// Value: 300
        case light
        /// Value: 400
        case normal
        /// Value: 500
        case medium
        /// Value: 600
        case semibold
        /// Value: 700
        case bold
        /// Value: 800
        case extraBold
        /// Value: 900
        case black
        
        /// Custom value [Not recommended]
        case custom(Int)
        
        private static var standardCasesStorage: [Int: Self] = [
            100: .thin,   200: .extraLight, 300: .light,
            400: .normal, 500: .medium,     600: .semibold,
            700: .bold,   800: .extraBold,  900: .black
        ]
        
        public init(integerLiteral value: Int) { self.init(rawValue: value) }
        
        public init(rawValue: Int) {
            if let value = Self.standardCasesStorage[rawValue] { self = value }
            else { self = .custom(rawValue) }
        }
        
        public var rawValue: Int {
            switch self {
            case .thin:       return 100
            case .extraLight: return 200
            case .light:      return 300
            case .normal:     return 400
            case .medium:     return 500
            case .semibold:   return 600
            case .bold:       return 700
            case .extraBold:  return 800
            case .black:      return 900
                
            case let .custom(value):
                return value
            }
        }
        
        public static func < (lhs: Font.Weight, rhs: Font.Weight) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
        
    }
    
    struct Name: ExpressibleByStringLiteral, RawRepresentable {
        public var rawValue: String
        
        public init(stringLiteral value: String) {
            self.init(value)
        }
        
        public init(_ name: String) {
            self.init(rawValue: name)
        }
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
}

public struct Font {
    public var name: Name
    public var size: Dimensions.Length?
    public var weight: Weight?
    
    init(name: Name, size: Dimensions.Length? = .none, weight: Weight? = .none) {
        self.name = name
        self.size = size
        self.weight = weight
    }
}
