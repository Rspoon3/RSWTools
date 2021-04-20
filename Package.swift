// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RSWTools",
    platforms: [
        .iOS(.v14),
    ], products: [
        .library(
            name: "RSWTools",
            targets: ["RSWTools"]),
    ],
       targets: [
        .target(
            name: "RSWTools",
            dependencies: []),
        .testTarget(
            name: "RSWToolsTests",
            dependencies: ["RSWTools"]),
    ]
)
