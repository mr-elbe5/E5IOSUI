// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "E5IOSUI",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "E5IOSUI",
            targets: ["E5IOSUI"]),
    ],
    dependencies: [
        .package(
            url: "https://git.elbe5cloud.de/miro/E5Data",
            from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "E5IOSUI", dependencies: ["E5Data"]),
    ]
)
