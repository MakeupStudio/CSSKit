// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSS",
    products: [
        .library(name: "CSS",
                 targets: ["CSS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MakeupStudio/MarkupCore.git",
                 from: "1.0.0"),
        .package(url: "https://github.com/MakeupStudio/Palette.git",
                 from: "2.0.0")
    ],
    targets: [
        .target(
            name: "CSS",
            dependencies: ["MarkupCore", "Palette"]),
        .testTarget(
            name: "CSSTests",
            dependencies: ["CSS"]),
    ]
)
