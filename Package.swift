// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SwiftWebinix",
	products: [
		.library(
			name: "SwiftWebinix",
			targets: ["SwiftWebinix"]
		),
	],
	targets: [
		.target(
			name: "SwiftWebinix",
			dependencies: ["webinix"]
		),
		.target(
			name: "webinix",
			dependencies: [],
			exclude: [
				"examples",
				"bridge",
				"CMakeLists.txt",
			],
			sources: [
				"src/webinix.c",
				"src/civetweb/civetweb.c",
			],
			cSettings: [
				.define("NDEBUG"),
				.define("NO_CACHING"),
				.define("NO_CGI"),
				.define("USE_WEBSOCKET"),
				.define("NO_SSL"),
			]
		),
		// Examples
		.executableTarget(
			name: "Minimal",
			dependencies: ["SwiftWebinix"],
			path: "Examples/Minimal"
		),
		.executableTarget(
			name: "CallSwiftFromJS",
			dependencies: ["SwiftWebinix"],
			path: "Examples/CallSwiftFromJS"
		),
	]
)
