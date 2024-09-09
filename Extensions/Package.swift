// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Extensions",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Extensions",
            targets: ["Extensions"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Extensions",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "ExtensionsTests",
            dependencies: ["Extensions"],
            path: "Tests"
        )
    ]
)
