// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "PlatformChecker",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
    .macCatalyst(.v15),
    .tvOS(.v15),
    .visionOS(.v1),
    .watchOS(.v9),
  ],
  products: [
    .library(
      name: "PlatformChecker",
      targets: ["PlatformChecker"]
    )
  ],
  targets: [
    .target(
      name: "PlatformChecker",
      dependencies: [],
      swiftSettings: [
        .swiftLanguageMode(.v6)
      ]
    ),
    .testTarget(
      name: "PlatformCheckerTests",
      dependencies: ["PlatformChecker"],
      path: "Tests",
      swiftSettings: [
        .swiftLanguageMode(.v6)
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)
