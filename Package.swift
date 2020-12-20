// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
	name: "SwiftCSV",
	platforms: [
		.macOS(.v10_15)
	],
	products: [.library(name: "SwiftCSV", targets: ["SwiftCSV"])],
	dependencies: [
		.package(name: "PerfectCURL", url: "https://github.com/PerfectlySoft/Perfect-CURL.git", "5.0.0"..<"10.0.0"),
	],
	targets: [
		.target(name: "SwiftCSV", dependencies: ["PerfectCURL"])
	]
)
