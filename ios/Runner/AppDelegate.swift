import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    SwiftFlutterNsdPlugin.register(with: self.registrar(forPlugin: "flutter_nsd") as! FlutterPluginRegistrar)
    
//    SwiftFlutterNsdPlugin.register(with: self.registrar(forPlugin: "flutter_nsd"))
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

