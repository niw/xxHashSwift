// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xxHash",
    products: [
        .library(
            name: "xxHash",
            targets: [
                "xxHash"
            ]
        )
    ],
    targets: [
        .target(
            name: "xxHash",
            dependencies: [
                .target(name: "xxHashLib")
            ]
        ),
        .target(
            name: "xxHashLib"
        ),
        .testTarget(
            name: "xxHashTests",
            dependencies: [
                .target(name: "xxHash")
            ]
        )
    ]
)
