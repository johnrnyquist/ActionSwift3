// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ActionSwift3",
    platforms: [.iOS(.v12)],  // iOS 12.0
    products: [.library(name: "ActionSwift3", targets: ["ActionSwift3"])],
    targets: [
        .target(name: "ActionSwift3", path: "Sources/ActionSwift3"),
        .testTarget(name: "ActionSwift3Tests", dependencies: ["ActionSwift3"], path: "Tests/ActionSwift3Tests")
    ]
)