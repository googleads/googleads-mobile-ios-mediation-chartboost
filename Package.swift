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
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "ChartboostAdapterTarget",
      targets: ["ChartboostAdapterTarget", "ChartboostSDK"]
    )
  ],
  targets: [
    .target(
      name: "ChartboostAdapterTarget",
      dependencies: [
        .target(name: "ChartboostAdapter")
      ],
      path: "ChartboostAdapterTarget"
    ),
    .binaryTarget(
      name: "ChartboostAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/chartboost/ChartboostAdapter-9.11.0.1.zip",
      checksum: "33e2978889354f11b4b6ed4cf902a9b5265b4033c1a447039d82afdfb50084a9"
    ),
    .binaryTarget(
      name: "ChartboostSDK",
      url:
        "https://s3.amazonaws.com/chartboost/sdk/9.11.0/Chartboost-iOS-9.11.0.zip",
      checksum: "45e0b6bda95cedea7a4b55da023aedd97e8bbb9e6abc121fb207edf008e6ec6b"
    ),
  ]
)
