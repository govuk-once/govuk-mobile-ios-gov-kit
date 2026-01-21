// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GovKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "GovKit",
            targets: ["GovKit"]
        ),
        .library(
            name: "GovKitUI",
            targets: ["GovKitUI"]
        )
    ],
    targets: [
        .target(
            name: "GovKit",
            dependencies: [
                "GovKitUI"
            ],
            path: "GovKit",
            sources: [
                "Sources"
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "GovKitUI",
            path: "GovKitUI",
            sources: [
                "Sources"
            ]
        ),
        .testTarget(
            name: "GovKitTests",
            dependencies: ["GovKit"],
            path: "GovKit",
            sources: [
                "Tests"
            ]
        ),
        .testTarget(
            name: "GovKitUITests",
            dependencies: ["GovKitUI"],
            path: "GovKitUI",
            sources: [
                "Tests"
            ]
        )
    ]
)
