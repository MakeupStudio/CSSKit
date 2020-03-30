// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CSSKit",
    products: [
        .library(name: "CSSKit", targets: ["CSSKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MakeupStudio/MarkupCore.git",
                 from: "1.0.0-alpha.2.0"),
        .package(url: "https://github.com/MakeupStudio/Palette.git",
                 from: "2.0.0")
    ],
    targets: [
        .target(
            name: "CSSKit",
            dependencies: ["MarkupCore", "Palette"]),
        .testTarget(
            name: "CSSKitTests",
            dependencies: ["CSSKit"]),
    ]
)
