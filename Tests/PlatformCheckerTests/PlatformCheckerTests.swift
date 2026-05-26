//
// Project: PlatformChecker
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation
import Testing

@testable import PlatformChecker

@Suite("PlatformChecker")
struct PlatformCheckerTests {

  @Test("OS checks match compilation platform")
  func osChecksMatchCompilationPlatform() {
    #if os(iOS) && !targetEnvironment(macCatalyst)
      #expect(PlatformCheck.isiOS)
    #else
      #expect(!PlatformCheck.isiOS)
    #endif

    #if os(tvOS)
      #expect(PlatformCheck.isTVOS)
    #else
      #expect(!PlatformCheck.isTVOS)
    #endif

    #if os(macOS) && !targetEnvironment(macCatalyst)
      #expect(PlatformCheck.isMacOS)
    #else
      #expect(!PlatformCheck.isMacOS)
    #endif

    #if os(watchOS)
      #expect(PlatformCheck.isWatchOS)
    #else
      #expect(!PlatformCheck.isWatchOS)
    #endif

    #if os(visionOS)
      #expect(PlatformCheck.isVisionOS)
    #else
      #expect(!PlatformCheck.isVisionOS)
    #endif
  }

  @Test("Target environment checks match compilation environment")
  func targetEnvironmentChecksMatchCompilationEnvironment() {
    #if targetEnvironment(macCatalyst)
      #expect(PlatformCheck.isMacCatalyst)
    #else
      #expect(!PlatformCheck.isMacCatalyst)
    #endif

    #if targetEnvironment(simulator)
      #expect(PlatformCheck.isSimulator)
    #else
      #expect(!PlatformCheck.isSimulator)
    #endif
  }

  @Test("Debug flag check matches compilation configuration")
  func debugFlagCheckMatchesCompilationConfiguration() {
    #if DEBUG
      #expect(PlatformCheck.isDebug)
    #else
      #expect(!PlatformCheck.isDebug)
    #endif
  }

  @Test("TestFlight detection recognises sandbox receipts")
  func testFlightDetectionRecognisesSandboxReceipts() {
    let receiptURL = URL(
      filePath: "/private/var/mobile/Containers/Bundle/Application/AppStoreReceipt/sandboxReceipt")

    #expect(PlatformCheck.isTestFlightReceiptURL(receiptURL))
  }

  @Test("TestFlight detection rejects App Store receipts")
  func testFlightDetectionRejectsAppStoreReceipts() {
    let receiptURL = URL(
      filePath: "/private/var/mobile/Containers/Bundle/Application/AppStoreReceipt/receipt")

    #expect(!PlatformCheck.isTestFlightReceiptURL(receiptURL))
  }

  @Test("TestFlight detection is case-sensitive")
  func testFlightDetectionIsCaseSensitive() {
    let receiptURL = URL(
      filePath: "/private/var/mobile/Containers/Bundle/Application/AppStoreReceipt/SandboxReceipt")

    #expect(!PlatformCheck.isTestFlightReceiptURL(receiptURL))
  }

  @Test("Public Platform facade forwards core environment checks")
  func publicFacadeForwardsCoreEnvironmentChecks() {
    #expect(Platform.isiOS == PlatformCheck.isiOS)
    #expect(Platform.isTVOS == PlatformCheck.isTVOS)
    #expect(Platform.isMacOS == PlatformCheck.isMacOS)
    #expect(Platform.isWatchOS == PlatformCheck.isWatchOS)
    #expect(Platform.isVisionOS == PlatformCheck.isVisionOS)
    #expect(Platform.isMacCatalyst == PlatformCheck.isMacCatalyst)
    #expect(Platform.isSimulator == PlatformCheck.isSimulator)
    #expect(Platform.isDebugMode == PlatformCheck.isDebug)
  }
}
