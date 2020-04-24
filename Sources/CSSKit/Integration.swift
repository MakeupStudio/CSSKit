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
public func generateIntegration(in type: String, builder: String, implement: Bool, useReturn: Bool, input: String, output: String) -> Bool {
    let manager = FileManager.default
    guard let data = manager.contents(atPath: input) else { return false }
    guard let content = String(data: data, encoding: .utf8) else { return false }
    
    let output = generateIntegration(in: type, builder: builder, implement: implement, useReturn: useReturn, from: content)
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
/// - Parameter implment: generate implementation header placeholder
/// - Parameter useReturn: use return keywords in functions
/// - Parameter builder: builder function of the target type
/// - Parameter content: content of `Style+StaticFactory.swift` file
public func generateIntegration(in type: String, builder: String, implement: Bool, useReturn: Bool, from content: String) -> String {
    var lines = content.components(separatedBy: .newlines)
    lines = Array(lines.drop(while: { !$0.contains("extension") }))
    
    var result = [String]()
    var _identifier = ""
    
    lines.forEach { line in
        if line.contains("extension") {
            if implement {
                result.append("// MARK: - Implementation")
                result.append("")
                result.append("extension \(type) {")
                result.append("")
                result.append("    internal func \(builder)(_ style: Style) -> Self {")
                result.append("        <#Implementation#>")
                result.append("    }")
                result.append("")
                result.append("}")
                result.append("")
            }
            result.append("// MARK: - Generated")
            result.append("")
            result.append("extension \(type) {")
        } else if line.contains("public static func ") {
            result.append(line.replacingOccurrences(of: "public static func", with: "public func"))
            _identifier = String(line.trimmingCharacters(in: .whitespaces).dropFirst(19))
            _identifier = String(_identifier[_identifier.startIndex..<_identifier.firstIndex(of: "(")!])
        } else if line.contains("return ") {
            result.append("        \(useReturn ? "return " : "")\(builder)(.\(_identifier)(value))")
        } else {
            result.append(line)
        }
    }
    return result.joined(separator: "\n")
}

#endif
