// swift-tools-version: 6.2
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
            name: "UIComponents",
            targets: ["UIComponents"]
        )
    ],
    targets: [
        .target(
            name: "GovKit",
            dependencies: [
                "UIComponents"
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
            name: "UIComponents",
            path: "UIComponents",
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
            name: "UIComponentsTests",
            dependencies: ["UIComponents"],
            path: "UIComponents",
            sources: [
                "Tests"
            ]
        )
    ]
)
