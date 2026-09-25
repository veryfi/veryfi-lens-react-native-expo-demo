import Expo
import React
import ReactAppDependencyProvider
import UIKit

@objc(ReactNativeSceneSupport)
class ReactNativeSceneSupport: NSObject {
  private class Delegate: ExpoReactNativeFactoryDelegate {
    override func sourceURL(for bridge: RCTBridge) -> URL? {
      bundleURL()
    }

    override func bundleURL() -> URL? {
#if DEBUG
      RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: ".expo/.virtual-metro-entry")
#else
      Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
    }
  }

  private static var delegate: Delegate?
  private static var factory: ExpoReactNativeFactory?

  @objc static func prepare() {
    let delegate = Delegate()
    delegate.dependencyProvider = RCTAppDependencyProvider()
    let factory = ExpoReactNativeFactory(delegate: delegate)
    self.delegate = delegate
    self.factory = factory

    if let appDelegate = UIApplication.shared.delegate as? ExpoAppDelegate {
      appDelegate.bindReactNativeFactory(factory)
    }
  }

  @objc(startIn:launchOptions:)
  static func start(in window: UIWindow, launchOptions: NSDictionary?) {
    factory?.startReactNative(
      withModuleName: "main",
      in: window,
      launchOptions: launchOptions as? [UIApplication.LaunchOptionsKey: Any]
    )
  }
}
