// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "AMDots",
  platforms: [.iOS(.v12)],
  products: [.library(name: "AMDots",
                      targets: ["AMDots"])],
  targets: [.target(name: "AMDots",
                    path: "AMDots/Classes")],
  swiftLanguageVersions: [.v5]
)
