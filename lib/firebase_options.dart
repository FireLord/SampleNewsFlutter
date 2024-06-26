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
    apiKey: 'AIzaSyD3QyEuVs-tUefHgAY9jkcSX6KNThMN6f4',
    appId: '1:460461505324:android:87753d432f499d1d338a89',
    messagingSenderId: '460461505324',
    projectId: 'iosfirebaselogin-e9d67',
    storageBucket: 'iosfirebaselogin-e9d67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcVhcizKqKfU1xDrcJ2zMEK_1FesWFYPk',
    appId: '1:460461505324:ios:f2fd2b72acce0be6338a89',
    messagingSenderId: '460461505324',
    projectId: 'iosfirebaselogin-e9d67',
    storageBucket: 'iosfirebaselogin-e9d67.appspot.com',
    iosClientId: '460461505324-h51ueiidukab7p38a16ql9tg4gsue08v.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleNews',
  );
}
