import XCTest
@testable import CSSKit

final class CSSKitTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(1000.in.ms.render(), 1.in.s.converted(to: .ms).render())
        XCTAssertEqual(1.in.kHz.render(), 1000.in.hz.converted(to: .kHz).render())
    }
    
    func testRendering() {
        let styles: StylesCollection = [
            .alignSelf(.center),
            .background(Color.brown.hex(uppercase: true, hashTagPrefix: true)),
            .borderRadius(1.in.px.render())
        ]
        let expectation = "align-self:center;background:#A52A2AFF;border-radius:1.0px;"
        XCTAssertEqual(styles.render(), expectation)
    }
    
    func testGenerateHTML() {
        let content =
        """
        //
        //  Style+StaticFactory.swift
        //  CSS
        //
        //  Created by Maxim Krouk on 9/1/19.
        //  Copyright © 2019 MakeupStudio. All rights reserved.
        //

        extension Style {
        
            public static func alignItems(_ value: String) -> Self {
                return .init(key: "align-items", value: value)
            }
        
            public static func alignSelf(_ value: String) -> Self {
                return .init(key: "align-self", value: value)
            }
        
        }
        """
        
        let expectation =
        """
        extension HTML {

            public func alignItems(_ value: String) -> Self {
                appendingStyle(.alignItems(value))
            }

            public func alignSelf(_ value: String) -> Self {
                appendingStyle(.alignSelf(value))
            }

        }
        """
        
        let output = generateIntegration(in: "HTML", builder: "appendingStyle", from: content)
        
        XCTAssertEqual(output, expectation)
    }
    
    static var allTests = [
        ("testExample", testExample),
        ("testRendering", testRendering),
    ]
}
