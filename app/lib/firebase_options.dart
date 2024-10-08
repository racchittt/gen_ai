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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXGHPTeEgVHZZtkrs4ALQATfXvClWC8dE',
    appId: '1:1061760502961:android:299ea412f54e46f1aea690',
    messagingSenderId: '1061760502961',
    projectId: 'genai-beab8',
    storageBucket: 'genai-beab8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaKjWxxJg3IF54bqCnwd2fvXFZMf-K_Lc',
    appId: '1:1061760502961:ios:7b209168caf88a3aaea690',
    messagingSenderId: '1061760502961',
    projectId: 'genai-beab8',
    storageBucket: 'genai-beab8.appspot.com',
    androidClientId: '1061760502961-09ei478m9khf2bqdu7apqaeeclojput5.apps.googleusercontent.com',
    iosClientId: '1061760502961-l0lnqo2jbdi9vnq6jopq8dcv2f0jbrll.apps.googleusercontent.com',
    iosBundleId: 'com.example.genAi',
  );

}