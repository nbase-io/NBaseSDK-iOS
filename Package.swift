// swift-tools-version:5.9
// NBase iOS SDK — Swift Package Manager 배포
//
// CocoaPods trunk 가 2026-12-02 부터 영구 읽기 전용이 되어 새 버전을 더 이상 올릴 수 없다
// (2026-11-01~07 은 읽기 전용 테스트 런). 기존 설치는 계속 동작하지만 신규 배포는 막히므로
// SPM 을 정식 배포 경로로 둔다. https://blog.cocoapods.org/
//
// ⚠️ 원격 binaryTarget 은 checksum 이 **필수**다. 빠지면 패키지 자체가 컴파일되지 않는다
// (직전 버전이 그 상태라 SPM 으로는 아무도 설치할 수 없었다).
// 체크섬은 릴리스 zip 의 SHA-256 이며 `swift package compute-checksum <zip>` 또는
// `shasum -a 256 <zip>` 으로 구한다. 버전을 올릴 때 url 과 checksum 을 **함께** 바꿀 것.

import PackageDescription

let package = Package(
    name: "NBase",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "NBase", targets: ["NBase"]),
        .library(name: "NChat", targets: ["NChat"]),
        .library(name: "AdapterAdStage", targets: ["AdapterAdStage"]),
        .library(name: "NBaseAdapterProviderSteam", targets: ["AdapterProviderSteam"]),
    ],
    targets: [
        .binaryTarget(
            name: "NBase",
            url: "https://github.com/nbase-io/NBaseSDK-iOS/releases/download/3.0.68/NBase.zip",
            checksum: "15fa216c4ea89dba89356c31a5aeff1b50b3b1a2161407a82f8e29759707c8ea"
        ),
        .binaryTarget(
            name: "NChat",
            url: "https://github.com/nbase-io/NBaseSDK-iOS/releases/download/3.0.53/NChat.zip",
            checksum: "02317cb8a897c7a4b9ec66085d490c36b340cbedaf8a3fe8cf85f279777ee27d"
        ),
        .binaryTarget(
            name: "AdapterAdStage",
            url: "https://github.com/nbase-io/NBaseSDK-iOS/releases/download/3.0.11/AdapterAdStage.zip",
            checksum: "20d4e9c8a22754a3a2afc5753f777e9107ab6bb24ec49db5f07fe3cfaf7546ca"
        ),
        .binaryTarget(
            name: "AdapterProviderSteam",
            url: "https://github.com/nbase-io/NBaseSDK-iOS/releases/download/3.0.62/AdapterProviderSteam.zip",
            checksum: "4c56d1a364ba6a7e8bf6bfb009f513eab60317a65db67dc9109bb163d93916ce"
        ),
    ]
)
