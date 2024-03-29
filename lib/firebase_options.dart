// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyASfobnA_fW5pVt8IDJVfZ80qjc-6K4yHQ',
    appId: '1:243313120936:web:444c02425df7cc82c7d49d',
    messagingSenderId: '243313120936',
    projectId: 'store-manager-a3503',
    authDomain: 'store-manager-a3503.firebaseapp.com',
    storageBucket: 'store-manager-a3503.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfVLhlMT0eD0yQ7cRa5mcuE8XQ3LXjl9Y',
    appId: '1:243313120936:android:b5ed5a06378795aac7d49d',
    messagingSenderId: '243313120936',
    projectId: 'store-manager-a3503',
    storageBucket: 'store-manager-a3503.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnDJ1FjynXrnC2kFUMtgl7SVKX3pcTRqo',
    appId: '1:243313120936:ios:d63b4f2f92b79b7bc7d49d',
    messagingSenderId: '243313120936',
    projectId: 'store-manager-a3503',
    storageBucket: 'store-manager-a3503.appspot.com',
    iosBundleId: 'com.example.storeManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnDJ1FjynXrnC2kFUMtgl7SVKX3pcTRqo',
    appId: '1:243313120936:ios:8086a3ab1afc7155c7d49d',
    messagingSenderId: '243313120936',
    projectId: 'store-manager-a3503',
    storageBucket: 'store-manager-a3503.appspot.com',
    iosBundleId: 'com.example.storeManager.RunnerTests',
  );
}
