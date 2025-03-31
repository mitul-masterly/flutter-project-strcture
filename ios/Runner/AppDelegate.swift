import Flutter
import FirebaseCore
import UIKit
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {


//    if #available(iOS 10.0, *) {
//        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
//    }
//    #if STAGING
//      let filePath = Bundle.main.path(forResource: "Firebase/staging/GoogleService-Info_Staging", ofType: "plist")
//    #else
//      let filePath = Bundle.main.path(forResource: "Firebase/prod/GoogleService-Info_Prod", ofType: "plist")
//   #endif
//
//   guard let fileopts = FirebaseOptions(contentsOfFile: filePath!) else {
//       fatalError("Couldn't load config file")
//   }
   FirebaseApp.configure()

    application.registerForRemoteNotifications()
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
        GeneratedPluginRegistrant.register(with: registry)
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
