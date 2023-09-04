// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RSWTools",
    platforms: [
        .iOS(.v15),
    ], products: [
        .library(
            name: "RSWTools",
            targets: ["RSWTools"]),
    ],
    dependencies: [
        .package(name: "SwiftTools", url: "https://github.com/Rspoon3/SwiftTools.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "RSWTools",
            dependencies: [
                "SwiftTools"
            ]
        ),
        .testTarget(
            name: "RSWToolsTests",
            dependencies: ["RSWTools"]),
    ]
)
