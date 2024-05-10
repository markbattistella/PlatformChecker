//
// Project: PlatformChecker
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)
import UIKit
#else
import Foundation
#endif

/// `PlatformCheck` provides utilities for determining the operating system and device type
/// where the code is currently running. It is designed for use in cross-platform Swift projects
/// to facilitate conditional compilation and runtime decisions.
///
/// This enum employs static properties to check for specific OS and device conditions,
/// such as being on iOS but not a Mac Catalyst app, or running on the new visionOS platform.
/// It uses Swift's compilation conditions to distinguish between the target environments.
///
/// - Note: `PlatformCheck` is not intended to be instantiated or subclassed.
internal enum PlatformCheck {}

// MARK: - OS checks

internal extension PlatformCheck {

    /// Checks if the current operating system is iOS, excluding any Mac Catalyst apps.
    ///
    /// This property can be used to apply iOS-specific logic or resources while ensuring
    /// that Mac Catalyst environments are not mistakenly included.
    ///
    /// - Returns: `true` if the OS is iOS and not running as a Mac Catalyst app, 
    /// otherwise `false`.
    static var isiOS: Bool {
        #if os(iOS) && !targetEnvironment(macCatalyst)
        return true
        #else
        return false
        #endif
    }

    /// Checks if the current operating system is tvOS.
    ///
    /// Useful for applying tvOS-specific configurations or optimizations in a
    /// cross-platform application.
    ///
    /// - Returns: `true` if the OS is tvOS, otherwise `false`.
    static var isTVOS: Bool {
        #if os(tvOS)
        return true
        #else
        return false
        #endif
    }

    /// Determines if the current operating system is macOS, excluding Mac Catalyst apps.
    ///
    /// This is particularly useful for implementing macOS-specific functionality
    /// while excluding any iOS apps that might be running on macOS via Mac Catalyst.
    ///
    /// - Returns: `true` if the OS is macOS (excluding Mac Catalyst apps), otherwise `false`.
    static var isMacOS: Bool {
        #if os(macOS) && !targetEnvironment(macCatalyst)
        return true
        #else
        return false
        #endif
    }

    /// Indicates whether the current operating system is watchOS.
    ///
    /// Enables the implementation of watchOS-specific features or adjustments in a
    /// cross-platform project.
    ///
    /// - Returns: `true` if the OS is watchOS, otherwise `false`.
    static var isWatchOS: Bool {
        #if os(watchOS)
        return true
        #else
        return false
        #endif
    }

    /// Checks if the current operating system is visionOS, specific to Apple's Vision Pro devices.
    ///
    /// This property allows for the implementation of visionOS-specific logic or optimizations,
    /// catering to the unique capabilities and features of Vision Pro devices.
    ///
    /// - Returns: `true` if the OS is visionOS, otherwise `false`.
    static var isVisionOS: Bool {
        #if os(visionOS)
        return true
        #else
        return false
        #endif
    }
}

// MARK: - Device checks

extension PlatformCheck {

    /// Determines if the current device is an iPhone, excluding Mac Catalyst.
    ///
    /// This check is useful for applying iPhone-specific configurations
    /// in a cross-platform app, ensuring that the logic does not affect iPad
    /// or Mac Catalyst apps.
    ///
    /// - Returns: `true` if the device is an iPhone and not a Mac Catalyst app, otherwise `false`.
    static var isPhone: Bool {
        #if os(iOS) && !targetEnvironment(macCatalyst)
        return UIDevice.current.userInterfaceIdiom == .phone
        #else
        return false
        #endif
    }

    /// Determines if the current device is an iPad, excluding Mac Catalyst.
    ///
    /// Useful for tailoring the app experience to take advantage of the larger screen size
    /// and capabilities specific to iPads, without affecting iPhone or Mac Catalyst apps.
    ///
    /// - Returns: `true` if the device is an iPad and not running as a Mac Catalyst app,
    /// otherwise `false`.
    static var isPad: Bool {
        #if os(iOS) && !targetEnvironment(macCatalyst)
        return UIDevice.current.userInterfaceIdiom == .pad
        #else
        return false
        #endif
    }

    /// Checks if the current target device is a TV.
    ///
    /// This property is particularly useful for implementing tvOS-specific UI adjustments
    /// or functionalities in applications that span across multiple Apple platforms.
    ///
    /// - Returns: `true` if the device is a TV, otherwise `false`.
    static var isTV: Bool {
        #if os(tvOS)
        return UIDevice.current.userInterfaceIdiom == .tv
        #else
        return false
        #endif
    }

    /// Determines if the current target device is a Vision device, specific to visionOS.
    ///
    /// Enables the implementation of features or optimizations tailored to the unique
    /// user interface and capabilities of Vision Pro devices.
    ///
    /// - Returns: `true` if the device is a Vision device, otherwise `false`.
    static var isVision: Bool {
        #if os(visionOS)
        return UIDevice.current.userInterfaceIdiom == .vision
        #else
        return false
        #endif
    }
}

// MARK: - Target environments

extension PlatformCheck {

    /// Indicates if the app is running as a Mac Catalyst app.
    ///
    /// This check is useful for applying or excluding certain logic and resources
    /// when the iOS app is being run on macOS, allowing for a more integrated experience.
    ///
    /// - Returns: `true` if the app is running as a Mac Catalyst app, otherwise `false`.
    static var isMacCatalyst: Bool {
        #if targetEnvironment(macCatalyst)
        return true
        #else
        return false
        #endif
    }

    /// Determines if the app is running in a Simulator.
    ///
    /// This can be useful for disabling certain features or using mock data
    /// when running the app in the Xcode Simulator, as opposed to a real device.
    ///
    /// - Returns: `true` if the app is running in a Simulator, otherwise `false`.
    static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }

    /// Indicates whether the current build configuration is set for debugging.
    ///
    /// The value is determined at compile-time based on the presence of the `DEBUG` flag.
    /// - Returns: `true` if the `DEBUG` flag is active, `false` otherwise.
    static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    /// Determines if the app is being tested through TestFlight.
    ///
    /// This method checks the presence and location of the app's receipt.
    /// A non-sandbox receipt that is still in the App Store's domain suggests
    /// that the app is distributed via TestFlight.
    ///
    /// - Returns: `true` if the app is running through TestFlight, otherwise `false`.
    static var isTestFlight: Bool {
        guard let receiptURL = Bundle.main.appStoreReceiptURL else { return false }
        let receiptPath = receiptURL.path.lowercased()
        return receiptPath.contains("sandboxreceipt") == false && receiptPath.contains("receipt")
    }
}
