// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxCognito",
    platforms: [
        .macOS(.v10_13), .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "RxCognito",
            targets: ["RxCognito"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "AWSSDKSwift", url: "https://github.com/swift-aws/aws-sdk-swift.git", from: "4.7.0"),
        .package(url: "https://github.com/adam-fowler/big-num", from: "2.0.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.1.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "RxCognito",
            dependencies: ["AWSSDKSwift", .product(name: "CognitoIdentityProvider", package: "AWSSDKSwift"), .product(name:"BigNum", package: "big-num")]),
        .testTarget(
            name: "RxCognitoTests",
            dependencies: ["RxCognito"]),
    ]
)
