//
// Project: PlatformChecker
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import XCTest
@testable import PlatformChecker

final class PlatformCheckTests: XCTestCase {

    /// Tests the `isiOS` property of `PlatformCheck`.
    /// Asserts true if compiled for iOS (excluding Mac Catalyst), otherwise asserts false.
    func testIsiOS() {
        #if os(iOS) && !targetEnvironment(macCatalyst)
        XCTAssertTrue(PlatformCheck.isiOS)
        #else
        XCTAssertFalse(PlatformCheck.isiOS)
        #endif
    }

    /// Tests the `isTVOS` property of `PlatformCheck`.
    /// Asserts true if compiled for tvOS, otherwise asserts false.
    func testIsTVOS() {
        #if os(tvOS)
        XCTAssertTrue(PlatformCheck.isTVOS)
        #else
        XCTAssertFalse(PlatformCheck.isTVOS)
        #endif
    }

    /// Tests the `isMacOS` property of `PlatformCheck`.
    /// Asserts true if compiled for macOS (excluding Mac Catalyst), otherwise asserts false.
    func testIsMacOS() {
        #if os(macOS) && !targetEnvironment(macCatalyst)
        XCTAssertTrue(PlatformCheck.isMacOS)
        #else
        XCTAssertFalse(PlatformCheck.isMacOS)
        #endif
    }

    /// Tests the `isWatchOS` property of `PlatformCheck`.
    /// Asserts true if compiled for watchOS, otherwise asserts false.
    func testIsWatchOS() {
        #if os(watchOS)
        XCTAssertTrue(PlatformCheck.isWatchOS)
        #else
        XCTAssertFalse(PlatformCheck.isWatchOS)
        #endif
    }

    /// Tests the `isVisionOS` property of `PlatformCheck`.
    /// Asserts true if compiled for visionOS, otherwise asserts false.
    func testIsVisionOS() {
        #if os(visionOS)
        XCTAssertTrue(PlatformCheck.isVisionOS)
        #else
        XCTAssertFalse(PlatformCheck.isVisionOS)
        #endif
    }

    /// Tests the `isMacCatalyst` property of `PlatformCheck`.
    /// Asserts true if the environment is Mac Catalyst, otherwise asserts false.
     func testIsMacCatalyst() {
        #if targetEnvironment(macCatalyst)
        XCTAssertTrue(PlatformCheck.isMacCatalyst)
        #else
        XCTAssertFalse(PlatformCheck.isMacCatalyst)
        #endif
    }

    /// Tests the `isSimulator` property of `PlatformCheck`.
    /// Asserts true if the environment is a simulator, otherwise asserts false.
    func testIsSimulator() {
        #if targetEnvironment(simulator)
        XCTAssertTrue(PlatformCheck.isSimulator)
        #else
        XCTAssertFalse(PlatformCheck.isSimulator)
        #endif
    }

    /// Tests the `isDebug` property of `PlatformCheck`.
    /// Asserts true if the build configuration includes the DEBUG flag, otherwise asserts false.
    func testIsDebug() {
        #if DEBUG
        XCTAssertTrue(PlatformCheck.isDebug)
        #else
        XCTAssertFalse(PlatformCheck.isDebug)
        #endif
    }
}
