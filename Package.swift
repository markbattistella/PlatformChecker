// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "PlatformChecker",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_13),
    .macCatalyst(.v13),
    .tvOS(.v12),
    .visionOS(.v1),
    .watchOS(.v4),
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
