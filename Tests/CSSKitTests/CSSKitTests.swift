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
    
    static var allTests = [
        ("testExample", testExample),
        ("testRendering", testRendering),
    ]
}
