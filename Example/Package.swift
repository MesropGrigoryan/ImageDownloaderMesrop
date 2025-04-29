//
//  Package.swift
//  ImageDownloaderMesrop
//
//  Created by Mesrop Grigoryan on 29.04.25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "ImageDownloaderMesrop",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ImageDownloaderMesrop",
            targets: ["ImageDownloaderMesrop"]
        ),
    ],
    targets: [
        .target(
            name: "ImageDownloaderMesrop",
            path: "Sources/ImageDownloaderMesrop"
        ),
        .testTarget(
            name: "ImageDownloaderMesropTests",
            dependencies: ["ImageDownloaderMesrop"],
            path: "Tests"
        ),
    ]
)
