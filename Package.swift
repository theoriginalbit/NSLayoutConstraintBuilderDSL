// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NSLayoutConstraintBuilderDSL",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "NSLayoutConstraintBuilderDSL", targets: ["NSLayoutConstraintBuilderDSL"]),
    ],
    targets: [
        .target(name: "NSLayoutConstraintBuilderDSL"),
        .testTarget(name: "NSLayoutConstraintBuilderDSLTests", dependencies: ["NSLayoutConstraintBuilderDSL"]),
    ]
)
