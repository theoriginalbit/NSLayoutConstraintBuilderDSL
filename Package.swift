// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NSLayoutConstraintBuilderDSL",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "NSLayoutConstraintBuilderDSL", targets: ["NSLayoutConstraintBuilderDSL"]),
    ],
    targets: [
        .target(name: "NSLayoutConstraintBuilderDSL"),
    ]
)
