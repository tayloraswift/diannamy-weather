// swift-tools-version:4.0

// required: `libz-dev`, `libcairo-dev` `libjpeg-dev`,
// libglfw3: must be compiled → sudo apt-get install cmake xorg-dev → [build glfw3.2]

import PackageDescription

let package = Package(
    name: "Diannamy",
    products: [.executable(name: "diannamy", targets: ["diannamy"])],
    dependencies: [.package(url: "https://github.com/kelvin13/swift-opengl", .branch("master")),
                   .package(url: "https://github.com/kelvin13/noise", .branch("master")),
                   .package(url: "https://github.com/kelvin13/maxpng", .branch("master"))
                   ],
    targets: [
                .target(name: "GLFW"),
                .target(name: "Cairo"),
                .target(name: "SwiftCairo", dependencies: ["Cairo"]),
                .target(name: "Taylor"),
                .target(name: "Geometry"),
                .target(name: "diannamy", dependencies: ["OpenGL", "Noise", "MaxPNG", "GLFW", "SwiftCairo", "Taylor", "Geometry"], exclude: ["Sources/Shaders"])
             ],
    swiftLanguageVersions: [4]
                )
