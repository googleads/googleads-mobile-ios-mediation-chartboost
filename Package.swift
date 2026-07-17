// swift-tools-version:5.6

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
      targets: ["ChartboostAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/ChartBoost/chartboost-monetization-ios-sdk.git",
      exact: "9.13.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    ),
  ],
  targets: [
    .target(
      name: "ChartboostAdapterTarget",
      dependencies: [
        .target(name: "ChartboostAdapter"),
        .product(name: "ChartboostSDK", package: "chartboost-monetization-ios-sdk"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "ChartboostAdapterTarget"
    ),
    .binaryTarget(
      name: "ChartboostAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/chartboost/ChartboostAdapter-9.13.0.0.zip",
      checksum: "e015aa881a724d0c2b4f13503055fa7c0662767c39b5b90eae938a90ddb71eab"
    ),
  ]
)
