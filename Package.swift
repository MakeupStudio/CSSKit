// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CSSKit",
    products: [
        .library(name: "CSSKit", targets: ["CSSKit"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/MakeupStudio/Palette.git",
            from: "4.0.0-beta.3.0"
        )
    ],
    targets: [
        .target(
            name: "CSSKit",
            dependencies: [
                .product(name: "Palette", package: "Palette")
            ]
        ),
        .testTarget(
            name: "CSSKitTests",
            dependencies: [
                .target(name: "CSSKit")
            ]
        ),
    ]
)
