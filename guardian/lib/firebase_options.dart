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
    apiKey: 'AIzaSyDCr0MvRn_faiZff-wMqdtK6V28DNBuvTg',
    appId: '1:978248307905:web:0facc0e5171c952be4f040',
    messagingSenderId: '978248307905',
    projectId: 'guardian-7397e',
    authDomain: 'guardian-7397e.firebaseapp.com',
    storageBucket: 'guardian-7397e.appspot.com',
    measurementId: 'G-60BTZM8W33',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9Fu1wjBeAKT0mvN0a6Eu8Wr5ehzKxnUY',
    appId: '1:978248307905:android:a505fb3f41ce1fede4f040',
    messagingSenderId: '978248307905',
    projectId: 'guardian-7397e',
    storageBucket: 'guardian-7397e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfPBLWEPCJEt-NFuHjHIH_1bCqv_RBRgg',
    appId: '1:978248307905:ios:436f3636343df69be4f040',
    messagingSenderId: '978248307905',
    projectId: 'guardian-7397e',
    storageBucket: 'guardian-7397e.appspot.com',
    iosClientId: '978248307905-u7rkrph834bbv4b9t3ue04srtuh12itv.apps.googleusercontent.com',
    iosBundleId: 'com.example.guardian',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfPBLWEPCJEt-NFuHjHIH_1bCqv_RBRgg',
    appId: '1:978248307905:ios:436f3636343df69be4f040',
    messagingSenderId: '978248307905',
    projectId: 'guardian-7397e',
    storageBucket: 'guardian-7397e.appspot.com',
    iosClientId: '978248307905-u7rkrph834bbv4b9t3ue04srtuh12itv.apps.googleusercontent.com',
    iosBundleId: 'com.example.guardian',
  );
}