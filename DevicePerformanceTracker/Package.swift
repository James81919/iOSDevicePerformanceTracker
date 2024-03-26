// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DevicePerformanceTracker",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DevicePerformanceTracker",
            targets: ["DevicePerformanceTracker"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChangYeop-Yang/Universal-SystemKit.git", from: Version(2,3,1))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DevicePerformanceTracker",
            dependencies: [
                .product(name: "SystemKit", package: "Universal-SystemKit")
            ])
    ]
)
