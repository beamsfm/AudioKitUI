// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AudioKitUI",
    platforms: [
        .macOS(.v11), .iOS(.v13)
    ],
    products: [
        .library(
            name: "AudioKitUI",
            targets: ["AudioKitUI"]),
    ],
    dependencies: [
	.package(url: "https://github.com/AudioKit/AudioKit.git", from: "v5.0beta1")
    ],
    targets: [
        .target(
            name: "AudioKitUI",
			dependencies: ["AudioKit"]),
        .testTarget(
            name: "AudioKitUITests",
            dependencies: ["AudioKitUI"]),
    ]
)
