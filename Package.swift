// swift-tools-version:5.3

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "ChartboostAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "ChartboostAdapterTarget",
      targets: ["ChartboostAdapterTarget", "ChartboostSDK"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    )
  ],
  targets: [
    .target(
      name: "ChartboostAdapterTarget",
      dependencies: [
        .target(name: "ChartboostAdapter"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "ChartboostAdapterTarget"
    ),
    .binaryTarget(
      name: "ChartboostAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/chartboost/ChartboostAdapter-9.12.0.0.zip",
      checksum: "78ee6e6fb77d9a79048b0a481d281af9fdc79f01e047761a980e0f7849ee9ad8"
    ),
    .binaryTarget(
      name: "ChartboostSDK",
      url:
        "https://s3.amazonaws.com/chartboost/sdk/9.12.0/Chartboost-iOS-9.12.0.zip",
      checksum: "8a611fed3d3e76be3faf13ffcfda6703c90abcbf415d610a6270d515dc9ae271"
    ),
  ]
)
