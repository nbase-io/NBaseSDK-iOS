// swift-tools-version: 5.9
import PackageDescription

// The package version is the tag of this repository (3.1.0 and later).
// Semver tags in this repository are package versions only. Older tags (3.0.x and below)
// belong to individual module releases and do not contain this file.
//
// Never replace a zip at an existing URL: SwiftPM verifies the checksum, so builds that
// already resolved this version would fail. Upload a fixed zip under a new release instead.
let release = "https://github.com/nbase-io/NBaseSDK-iOS/releases/download"

let package = Package(
    name: "NBaseSDK",
    platforms: [.iOS("15.1")],
    products: [
        .library(name: "NBase", targets: ["NBase", "NBaseDependencies"]),
        .library(name: "NBaseAdapterProviderGoogle", targets: ["AdapterProviderGoogle", "GoogleDependencies"]),
        .library(name: "NBaseAdapterProviderFacebook", targets: ["AdapterProviderFacebook", "FacebookDependencies"]),
        .library(name: "NBaseAdapterProviderGameCenter", targets: ["AdapterProviderGameCenter"]),
        .library(name: "NBaseAdapterProviderKakao", targets: ["AdapterProviderKakao"]),
        .library(name: "NBaseAdapterProviderLine", targets: ["AdapterProviderLine", "LineDependencies"]),
        .library(name: "NBaseAdapterProviderNaver", targets: ["AdapterProviderNaver", "NaverDependencies"]),
        .library(name: "NBaseAdapterProviderSteam", targets: ["AdapterProviderSteam"]),
        .library(name: "NBaseAdapterProviderX", targets: ["AdapterProviderX"]),
        .library(name: "AdapterAdStage", targets: ["AdapterAdStage"]),

        // For Unity: linked to the app target so that Xcode embeds the dynamic framework,
        // while the products above are linked to UnityFramework. They hold the binary only,
        // so the source dependencies are not linked into the app a second time.
        .library(name: "NBaseEmbed", targets: ["NBase"]),
        .library(name: "NBaseAdapterProviderGoogleEmbed", targets: ["AdapterProviderGoogle"]),
        .library(name: "NBaseAdapterProviderLineEmbed", targets: ["AdapterProviderLine"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.9.1"),
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", exact: "16.1.1"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", exact: "5.19.1"),
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "1.15.2"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS.git", from: "7.1.0"),
        .package(url: "https://github.com/facebook/facebook-ios-sdk.git", exact: "17.4.0"),
        .package(url: "https://github.com/line/line-sdk-ios-swift.git", exact: "5.11.1"),
        .package(url: "https://github.com/naver/naveridlogin-sdk-ios.git", exact: "4.2.3"),
    ],
    targets: [
        .binaryTarget(name: "NBase",
                      url: "\(release)/3.0.69/NBase.zip",
                      checksum: "7ee5e110d78d9b35fdbffcdacf52ffc75fbedff123dbdb1adadac81af96e64f1"),
        .binaryTarget(name: "AdapterProviderGoogle",
                      url: "\(release)/3.0.58/AdapterProviderGoogle.zip",
                      checksum: "67953bd8d8281ff71a6b017a0968d8d5e03f6e11f39ecf269f59fe465e3c3edf"),
        .binaryTarget(name: "AdapterProviderFacebook",
                      url: "\(release)/3.0.58/AdapterProviderFacebook.zip",
                      checksum: "63a3906fcf0945de48321605499b3e507fe6f3e89d9c77c8b1235752e445fcbf"),
        .binaryTarget(name: "AdapterProviderGameCenter",
                      url: "\(release)/3.0.58/AdapterProviderGameCenter.zip",
                      checksum: "f4a3a579ed238883cdf5d606765b1a4e6b3208e96700891e31a0dcee24b304b2"),
        .binaryTarget(name: "AdapterProviderKakao",
                      url: "\(release)/3.0.57/AdapterProviderKakao.zip",
                      checksum: "24648d4bda21ff34ba4c568f993a0eb2698c9557ff57c06f22ee5694171328b3"),
        .binaryTarget(name: "AdapterProviderLine",
                      url: "\(release)/3.0.58/AdapterProviderLine.zip",
                      checksum: "6e37d2a46ee1d04364e0ea157868ff98c0e2054f5fc8f04e9e86c81686cb7e64"),
        .binaryTarget(name: "AdapterProviderNaver",
                      url: "\(release)/3.0.58/AdapterProviderNaver.zip",
                      checksum: "293c0c129ca7209547a7ede71dc6da30dd71a912819711dd5399c19233ad5c67"),
        .binaryTarget(name: "AdapterProviderSteam",
                      url: "\(release)/3.0.62/AdapterProviderSteam.zip",
                      checksum: "4c56d1a364ba6a7e8bf6bfb009f513eab60317a65db67dc9109bb163d93916ce"),
        .binaryTarget(name: "AdapterProviderX",
                      url: "\(release)/3.0.58/AdapterProviderX.zip",
                      checksum: "990e4903b834a3ea777db3b386792ef7d31328346271ddb2d4ef4b40a8f23fa1"),
        .binaryTarget(name: "AdapterAdStage",
                      url: "\(release)/3.0.13/AdapterAdStage.zip",
                      checksum: "78a75eaa939d6cdc90f2865ba765b884002598b9c1990c5f8b3af8282878e13c"),

        // A binary target cannot declare dependencies, so these empty targets carry them.
        .target(name: "NBaseDependencies", dependencies: [
            .product(name: "Alamofire", package: "Alamofire"),
            .product(name: "SocketIO", package: "socket.io-client-swift"),
            .product(name: "SDWebImage", package: "SDWebImage"),
            .product(name: "Apollo", package: "apollo-ios"),
            .product(name: "ApolloAPI", package: "apollo-ios"),
        ]),
        .target(name: "GoogleDependencies", dependencies: [
            .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
        ]),
        .target(name: "FacebookDependencies", dependencies: [
            .product(name: "FacebookLogin", package: "facebook-ios-sdk"),
        ]),
        .target(name: "LineDependencies", dependencies: [
            .product(name: "LineSDK", package: "line-sdk-ios-swift"),
        ]),
        .target(name: "NaverDependencies", dependencies: [
            .product(name: "NaverThirdPartyLogin", package: "naveridlogin-sdk-ios"),
        ]),
    ]
)
