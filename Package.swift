// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RSWTools",
    platforms: [
        .iOS(.v13),
    ], products: [
        .library(
            name: "RSWTools",
            targets: ["RSWTools"]),
    ],
    dependencies: [
        .package(name: "SFSymbols", url: "https://github.com/Rspoon3/SFSymbols.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "RSWTools",
            dependencies: [
                "SFSymbols"
            ]
        ),
        .testTarget(
            name: "RSWToolsTests",
            dependencies: ["RSWTools"]),
    ]
)
