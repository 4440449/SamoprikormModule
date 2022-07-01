// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SamoprikormModule",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SamoprikormModule",
            targets: ["SamoprikormModule"]),
    ],
    dependencies: [
        .package(name: "BabyNet",
                 url: "https://github.com/4440449/BabyNet.git",
                 .branch("master"))
    ],
    targets: [
        .target(
            name: "SamoprikormModule",
            dependencies: ["BabyNet"]),
        .testTarget(
            name: "SamoprikormModuleTests",
            dependencies: ["SamoprikormModule"]),
    ]
)
