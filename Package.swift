import PackageDescription

let package = Package(
    name: "ActionSwift3",
    products: [
        .library(name: "ActionSwift3", targets: ["ActionSwift3"])
    ],
    targets: [
        .target(name: "ActionSwift3", path: "Sources/ActionSwift3", deploymentTargets: [.iOS("8.0")]),
        .testTarget(name: "ActionSwift3Tests", dependencies: ["ActionSwift3"], path: "Tests/ActionSwift3Tests", deploymentTargets: [.iOS("12.0")])
    ]
)
