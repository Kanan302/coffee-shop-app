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
    apiKey: 'AIzaSyAlLasHB3tmo2u6TSUOYYEgLKuxIPoRJbk',
    appId: '1:956712450131:web:5a4a8a6d2d4ebff31d2ea6',
    messagingSenderId: '956712450131',
    projectId: 'coffee-shop-firebase',
    authDomain: 'coffee-shop-firebase.firebaseapp.com',
    storageBucket: 'coffee-shop-firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBB29wKjQ62ojp7xJz1uKB3nL_eSKFKHM4',
    appId: '1:956712450131:android:cd1d16e90bf00e561d2ea6',
    messagingSenderId: '956712450131',
    projectId: 'coffee-shop-firebase',
    storageBucket: 'coffee-shop-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATOJqDqhvv_QV5RVk_qibP3yYSYytk-yA',
    appId: '1:956712450131:ios:f677ffec39c4f0611d2ea6',
    messagingSenderId: '956712450131',
    projectId: 'coffee-shop-firebase',
    storageBucket: 'coffee-shop-firebase.appspot.com',
    iosBundleId: 'com.example.coffeeShopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATOJqDqhvv_QV5RVk_qibP3yYSYytk-yA',
    appId: '1:956712450131:ios:bb831c798450b2021d2ea6',
    messagingSenderId: '956712450131',
    projectId: 'coffee-shop-firebase',
    storageBucket: 'coffee-shop-firebase.appspot.com',
    iosBundleId: 'com.example.coffeeShopApp.RunnerTests',
  );
}
