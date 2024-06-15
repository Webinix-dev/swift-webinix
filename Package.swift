// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

var webinixCSettings: [CSetting] = [
	.define("NDEBUG"),
	.define("NO_CACHING"),
	.define("NO_CGI"),
	.define("USE_WEBSOCKET"),
]
var webinixLinkerSettings: [LinkerSetting] = [
	.linkedLibrary("Ws2_32", .when(platforms: [.windows])),
	.linkedLibrary("Ole32", .when(platforms: [.windows])),
	.linkedFramework("WebKit", .when(platforms: [.macOS])),
	.linkedFramework("Cocoa", .when(platforms: [.macOS])),
]

if ProcessInfo.processInfo.environment["USE_TLS"] != nil {
	webinixCSettings += [
		.define("WEBUI_USE_TLS"),
		.define("WEBUI_TLS"),
		.define("NO_SSL_DL"),
		.define("OPENSSL_API_1_1"),
	]
	webinixLinkerSettings += [
		.linkedLibrary("ssl"),
		.linkedLibrary("crypto"),
		.linkedLibrary("Bcrypt", .when(platforms: [.windows])),
	]
} else {
	webinixCSettings += [
		.define("NO_SSL"),
	]
}

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
			cSettings: webinixCSettings,
			linkerSettings: webinixLinkerSettings
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
		.executableTarget(
			name: "ServeAFolder",
			dependencies: ["SwiftWebinix"],
			path: "Examples/ServeAFolder",
			resources: [
				.copy("ui"),
			]
		),
	]
)
