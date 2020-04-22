//
//  Integration.swift
//  CSSKit
//
//  Created by Maxim Krouk on 4/21/20.
//

import Foundation

#if DEBUG
/// Should only be used for integration generations
///
/// Builder function should have this signature:
/// ```
/// func <name>(_ style: Style) -> Self
/// ```
///
/// - Parameter type: type to integrate the framework in
/// - Parameter builder: builder function of the target type
/// - Parameter input: path to `Style+StaticFactory.swift`
/// - Parameter output: path to output file
@discardableResult
@available(*, deprecated, message: "Should only be used for integration generations")
public func generateIntegration(in type: String, builder: String, input: String, output: String) -> Bool {
    let manager = FileManager.default
    guard let data = manager.contents(atPath: input) else { return false }
    guard let content = String(data: data, encoding: .utf8) else { return false }
    
    let output = generateIntegration(in: type, builder: builder, from: content)
    guard let outputData = output.data(using: .utf8) else { return false }
    
    return manager.createFile(atPath: output, contents: outputData, attributes: .none)
}

/// Should only be used for integration generations
///
/// Builder function should have this signature:
/// ```
/// func <name>(_ style: Style) -> Self
/// ```
///
/// - Parameter type: type to integrate the framework in
/// - Parameter builder: builder function of the target type
/// - Parameter content: content of `Style+StaticFactory.swift` file
@available(*, deprecated, message: "Should only be used for integration generations")
public func generateIntegration(in type: String, builder: String, from content: String) -> String {
    var lines = content.components(separatedBy: .newlines)
    lines = Array(lines.drop(while: { !$0.contains("extension") }))
    
    var result = [String]()
    var _identifier = ""
    
    lines.forEach { line in
        if line.contains("extension") {
            result.append("extension \(type) {")
        } else if line.contains("public static func ") {
            result.append(line.replacingOccurrences(of: "public static func", with: "public func"))
            _identifier = String(line.trimmingCharacters(in: .whitespaces).dropFirst(19))
            _identifier = String(_identifier[_identifier.startIndex..<_identifier.firstIndex(of: "(")!])
        } else if line.count > 5 {
            result.append("        \(builder)(.\(_identifier)(value))")
        } else {
            result.append(line)
        }
    }
    return result.joined(separator: "\n")
}
#endif
