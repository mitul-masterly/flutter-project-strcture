// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_project_structure/utils/flavors.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // if (kIsWeb) {
    //   return web;
    // }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return FlavorConfig.isStaging ? android_staging : android_prod;
      case TargetPlatform.iOS:
        return FlavorConfig.isStaging ? ios_staging : ios_prod;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }


  static const FirebaseOptions android_prod = FirebaseOptions(
    apiKey: 'AIzaSyCARi30S-QEuWy7iVKQYrlrrPvL5OcGJPo',
    appId: '1:545061596433:android:02c63b08a6138194df70b0',
    messagingSenderId: '545061596433',
    projectId: 'masterly-flutterbasecode',
    storageBucket: 'masterly-flutterbasecode.firebasestorage.app',
  );

  static const FirebaseOptions android_staging = FirebaseOptions(
    apiKey: 'AIzaSyCARi30S-QEuWy7iVKQYrlrrPvL5OcGJPo',
    appId: '1:545061596433:android:22b40f355608c67fdf70b0',
    messagingSenderId: '545061596433',
    projectId: 'masterly-flutterbasecode',
    storageBucket: 'masterly-flutterbasecode.firebasestorage.app',
  );

  static const FirebaseOptions ios_staging = FirebaseOptions(
    apiKey: 'AIzaSyDdvrJD0jBqWNChUIxlhrht4MbDVTHlTcw',
    appId: '1:545061596433:ios:608bb317131ea832df70b0',
    messagingSenderId: '545061596433',
    projectId: 'masterly-flutterbasecode',
    storageBucket: 'masterly-flutterbasecode.firebasestorage.app',
    iosBundleId: 'com.masterly.flutterbasecodestg',
  );
  static const FirebaseOptions ios_prod = FirebaseOptions(
    apiKey: 'AIzaSyDdvrJD0jBqWNChUIxlhrht4MbDVTHlTcw',
    appId: '1:545061596433:ios:8a17273d99bc3d81df70b0',
    messagingSenderId: '545061596433',
    projectId: 'masterly-flutterbasecode',
    storageBucket: 'masterly-flutterbasecode.firebasestorage.app',
    iosBundleId: 'com.masterly.flutterbasecode',
  );
}
