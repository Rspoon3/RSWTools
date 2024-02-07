// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RSWTools",
    platforms: [
        .iOS(.v15),
        .visionOS(.v1)
    ], products: [
        .library(
            name: "RSWTools",
            targets: ["RSWTools"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Rspoon3/SwiftTools.git", exact: "1.1.0")
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
            dependencies: ["RSWTools"]
        ),
    ]
)
