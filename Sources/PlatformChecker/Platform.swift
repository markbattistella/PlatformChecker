//
// Project: PlatformChecker
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// `Platform` provides a structured and intuitive way to access environment-specific checks 
/// across different Apple platforms and configurations.
public struct Platform {}

// MARK: - OS Types

extension Platform {

    /// Returns `true` if the current operating system is iOS, excluding Mac Catalyst apps.
    /// Useful for applying iOS-specific logic or resources.
    public static var isiOS: Bool { PlatformCheck.isiOS }

    /// Returns `true` if the current operating system is tvOS. Useful for applying tvOS-specific
    /// configurations or optimizations.
    public static var isTVOS: Bool { PlatformCheck.isTVOS }

    /// Returns `true` if the current operating system is macOS, excluding Mac Catalyst apps.
    /// Useful for implementing macOS-specific functionality.
    public static var isMacOS: Bool { PlatformCheck.isMacOS }

    /// Returns `true` if the current operating system is watchOS. Enables the implementation
    /// of watchOS-specific features or adjustments.
    public static var isWatchOS: Bool { PlatformCheck.isWatchOS }

    /// Returns `true` if the current operating system is visionOS, specific to Apple's Vision
    /// Pro devices. Allows for the implementation of visionOS-specific logic or optimizations.
    public static var isVisionOS: Bool { PlatformCheck.isVisionOS }
}

// MARK: - Device Types

extension Platform {

    /// Returns `true` if the current device is an iPhone, excluding Mac Catalyst. Useful
    /// for applying iPhone-specific configurations.
    public static var isiPhone: Bool { PlatformCheck.isPhone }

    /// Returns `true` if the current device is an iPad, excluding Mac Catalyst. Useful for
    /// tailoring experiences to take advantage of iPad's larger screen and capabilities.
    public static var isiPad: Bool { PlatformCheck.isPad }

    /// Returns `true` if the current device is identified as a TV. Useful for implementing
    /// tvOS-specific UI adjustments or functionalities.
    public static var isTV: Bool { PlatformCheck.isTV }

    /// Returns `true` if the current device is a Vision device, specific to visionOS. Enables
    /// the implementation of features tailored to the unique UI and capabilities of
    /// Vision Pro devices.
    public static var isVisionDevice: Bool { PlatformCheck.isVision }

    /// Returns `true` if the app is running as a Mac Catalyst app. Useful for applying or
    /// excluding certain logic and resources when the iOS app is run on macOS.
    public static var isMacCatalyst: Bool { PlatformCheck.isMacCatalyst }
}

// MARK: - Development

extension Platform {

    /// Returns `true` if the app is running in a simulator. This can be useful for disabling 
    /// certain features or using mock data when testing in the Xcode Simulator.
    public static var isSimulator: Bool { PlatformCheck.isSimulator }

    /// Returns `true` if the current build configuration is set for debugging. This indicates 
    /// that the `DEBUG` flag is active.
    public static var isDebugMode: Bool { PlatformCheck.isDebug }

    /// Returns `true` if the app is running through TestFlight. Checks the app's receipt to 
    /// determine if it's distributed via TestFlight outside of the sandbox environment.
    public static var isTestFlight: Bool { PlatformCheck.isTestFlight }
}

// MARK: - Design

extension Platform {

    /// Describes the Liquid Glass availability and usage status for the current platform.
    public static var liquidGlassStatus: LiquidGlassStatus {
        PlatformCheck.liquidGlassStatus
    }

    /// `true` if Liquid Glass is supported by the OS and is currently enabled (i.e. not opted out).
    public static var isUsingLiquidGlass: Bool {
        liquidGlassStatus == .enabled
    }

    /// `true` if the OS supports Liquid Glass, but the app has opted out via Info.plist.
    public static var hasOptedOutOfLiquidGlass: Bool {
        liquidGlassStatus == .optedOut
    }

    /// `true` if the current platform does not support Liquid Glass (pre-OS 26).
    public static var isLiquidGlassUnavailable: Bool {
        liquidGlassStatus == .unavailable
    }
}
