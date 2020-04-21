//
//  Erasable.swift
//  CSSKit
//
//  Created by Maxim Krouk on 4/21/20.
//

public protocol Erasable {
    associatedtype Erased
    var erased: Erased { get }
}
