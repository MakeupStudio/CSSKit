// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CSSKit",
    products: [
        .library(name: "CSSKit", targets: ["CSSKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MakeupStudio/Palette.git",
                 from: "2.0.0")
    ],
    targets: [
        .target(
            name: "CSSKit",
            dependencies: ["Palette"]),
        .testTarget(
            name: "CSSKitTests",
            dependencies: ["CSSKit"]),
    ]
)
