// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBbh2kvGr4tPxxHCtv0OdXZZtUkGCJ1WhM',
    appId: '1:663557330173:web:529c8f14e25533c3ac5a94',
    messagingSenderId: '663557330173',
    projectId: 'message-app-53bb3',
    authDomain: 'message-app-53bb3.firebaseapp.com',
    storageBucket: 'message-app-53bb3.firebasestorage.app',
    measurementId: 'G-53C5K5ZZ2Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJXTF7YbuuPbT85tGlHU_pw7otbLbu8V8',
    appId: '1:663557330173:android:fb4fda7308459b45ac5a94',
    messagingSenderId: '663557330173',
    projectId: 'message-app-53bb3',
    storageBucket: 'message-app-53bb3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7lL_NAoWhDuwenOPNUzEh5kIChvLuz9g',
    appId: '1:663557330173:ios:aa9ec89fa249fe71ac5a94',
    messagingSenderId: '663557330173',
    projectId: 'message-app-53bb3',
    storageBucket: 'message-app-53bb3.firebasestorage.app',
    iosBundleId: 'com.example.messageBoardApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7lL_NAoWhDuwenOPNUzEh5kIChvLuz9g',
    appId: '1:663557330173:ios:aa9ec89fa249fe71ac5a94',
    messagingSenderId: '663557330173',
    projectId: 'message-app-53bb3',
    storageBucket: 'message-app-53bb3.firebasestorage.app',
    iosBundleId: 'com.example.messageBoardApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbh2kvGr4tPxxHCtv0OdXZZtUkGCJ1WhM',
    appId: '1:663557330173:web:70703b0c31283f8dac5a94',
    messagingSenderId: '663557330173',
    projectId: 'message-app-53bb3',
    authDomain: 'message-app-53bb3.firebaseapp.com',
    storageBucket: 'message-app-53bb3.firebasestorage.app',
    measurementId: 'G-7ZQVY0RYE6',
  );
}
