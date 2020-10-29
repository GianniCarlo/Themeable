// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Themeable",
	platforms: [.macOS(.v10_12),
				.iOS(.v10),
				.tvOS(.v10),
				.watchOS(.v3)],
    products: [
        .library(
            name: "Themeable",
            targets: ["Themeable"]),
    ],
    targets: [
        .target(
            name: "Themeable",
            dependencies: []),
    ]
)
