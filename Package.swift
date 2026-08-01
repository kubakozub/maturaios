// swift-tools-version: 5.9
import PackageDescription

// MaturaCore celowo nie zna SwiftUI ani UIKit. Dzięki temu cała mechanika gry
// kompiluje się i testuje także poza macOS-em — tak samo jak w wersji na
// Androida, gdzie silnik jest czystym Kotlinem bez typów Androida.
let package = Package(
    name: "MaturaCore",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(name: "MaturaCore", targets: ["MaturaCore"]),
    ],
    targets: [
        .target(name: "MaturaCore"),
        .testTarget(name: "MaturaCoreTests", dependencies: ["MaturaCore"]),
    ]
)
