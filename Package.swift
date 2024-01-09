import PackageDescription

let package = Package(
    name: "NBaseFramework",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "NBaseFramework",
            targets: ["NBaseFramework"]),
    ],
    dependencies: [
        // 여기에 종속성 추가
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.8.1")),
        .package(url: "https://github.com/apollographql/apollo-ios.git", .upToNextMajor(from: "1.7.1"),
        .package(url: "https://github.com/socketio/socket.io-client-swift" .upToNextMajor(from: "16.1.0"),
    ),
    ],
    targets: [
        .target(
            name: "NBaseFramework",
            dependencies: [
                .product(name: "Alamofire", package: "alamofire"),
                .product(name: "Apollo", package: "apollo-ios"),
                .product(name: "SocketIO", package: "socket.io-client-swift")
            ],
            path: "NBase.framework"
    ]
)