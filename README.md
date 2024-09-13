<!-- markdownlint-disable MD033 MD041 -->
<div align="center">

# PlatformChecker

![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FPlatformChecker%2Fbadge%3Ftype%3Dswift-versions)

![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FPlatformChecker%2Fbadge%3Ftype%3Dplatforms)

![Licence](https://img.shields.io/badge/Licence-MIT-white?labelColor=blue&style=flat)

</div>

**PlatformChecker** provides a structured and intuitive way to access environment-specific checks across different Apple platforms. It is designed to facilitate the integration of platform-specific functionalities in cross-platform Swift projects.

## Features

- **Platform Checks:** Quickly determine which Apple platform your application is currently running on (iOS, macOS, watchOS, tvOS, visionOS).
- **Device Checks:** Easily identify device types such as iPhone, iPad, and Vision devices.
- **Environment Checks:** Check if your app is running as a Mac Catalyst app, in a simulator, or through TestFlight, and whether it's in debug mode.

## Installation

### Swift Package Manager

You can add PlatformChecker to your project via Swift Package Manager. Add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/markbattistella/PlatformChecker.git",
         from: "1.0.0"
    )
]
```

## Usage

Import PlatformChecker in the Swift file where you want to use the platform and device checks:

```swift
import PlatformChecker
```

### Example Usage

Here are some examples of how you can use PlatformChecker in your project:

```swift
if Platform.isiOS {
    print("Running on iOS")
}

if Platform.isiPhone {
    print("Device is an iPhone")
}

if Platform.isDebugMode {
    print("Debug mode is enabled")
}
```

These checks can be used to conditionally apply logic or configurations based on the operating system, device type, or runtime environment.

## Properties

| Property           | Description                                                               |
|--------------------|---------------------------------------------------------------------------|
| `Platform.isiOS`   | Returns `true` if running on iOS, excluding Mac Catalyst apps.            |
| `Platform.isTVOS`  | Returns `true` if running on tvOS.                                        |
| `Platform.isMacOS` | Returns `true` if running on macOS, excluding Mac Catalyst apps.          |
| `Platform.isWatchOS`| Returns `true` if running on watchOS.                                     |
| `Platform.isVisionOS`| Returns `true` if running on visionOS, specific to Apple's Vision Pro devices. |
| `Platform.isiPhone`| Returns `true` if the device is an iPhone, excluding Mac Catalyst.        |
| `Platform.isiPad`  | Returns `true` if the device is an iPad, excluding Mac Catalyst.          |
| `Platform.isTV`    | Returns `true` if the device is identified as a TV.                       |
| `Platform.isVisionDevice`| Returns `true` if the device is a Vision device, specific to visionOS.  |
| `Platform.isMacCatalyst`| Returns `true` if the app is running as a Mac Catalyst app.              |
| `Platform.isSimulator`| Returns `true` if the app is running in a simulator.                      |
| `Platform.isDebugMode`| Returns `true` if the current build configuration is set for debugging.   |
| `Platform.isTestFlight`| Returns `true` if the app is running through TestFlight.                 |

## Documentation

Each property in the Platform struct is documented with inline comments that explain what the property checks and its intended use case.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please fork the repository and submit a pull request.

## License

PlatformChecker is released under the MIT license. See [LICENSE](https://raw.githubusercontent.com/markbattistella/PlatformChecker/main/LICENCE) for details.
