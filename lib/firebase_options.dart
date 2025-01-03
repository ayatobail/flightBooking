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
    apiKey: 'AIzaSyDcjH6rQX7F2uyhgkf2O80LniU2YvU2UkE',
    appId: '1:467357577473:web:cf8a64131d0473aa63ab00',
    messagingSenderId: '467357577473',
    projectId: 'flightbooking-4bcbb',
    authDomain: 'flightbooking-4bcbb.firebaseapp.com',
    storageBucket: 'flightbooking-4bcbb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAV4EYLlsspfpf8LTuS-M6gxAnLC4PtGv0',
    appId: '1:467357577473:android:58a27edbef3e574363ab00',
    messagingSenderId: '467357577473',
    projectId: 'flightbooking-4bcbb',
    storageBucket: 'flightbooking-4bcbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjLVYwUNV4_CdR54z0AekLmK8xYCVeYgw',
    appId: '1:467357577473:ios:d16a102401c0cb5763ab00',
    messagingSenderId: '467357577473',
    projectId: 'flightbooking-4bcbb',
    storageBucket: 'flightbooking-4bcbb.appspot.com',
    iosBundleId: 'com.example.flightBookingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjLVYwUNV4_CdR54z0AekLmK8xYCVeYgw',
    appId: '1:467357577473:ios:bf20b1939daa23df63ab00',
    messagingSenderId: '467357577473',
    projectId: 'flightbooking-4bcbb',
    storageBucket: 'flightbooking-4bcbb.appspot.com',
    iosBundleId: 'com.example.flightBookingApp.RunnerTests',
  );
}
