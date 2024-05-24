import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/repository/AuthRepository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  RxString email = "".obs;
  RxString password = "".obs;
  Rxn<User?> user = Rxn<User?>();

  void onSignInEmail() async {
    final result = await authRepository.signInWithEmailAndPassword(email.value, password.value);
    if (result is Success) {
      if (kDebugMode) {
        print('Sign in success');
      }
      user.value = result.data;
    } else {
      if (kDebugMode) {
        print(result.message);
      }
    }
  }

  void onRegisterEmail() async {
    final result = await authRepository.registerWithEmailAndPassword(email.value, password.value);
    if (result is Success) {
      if (kDebugMode) {
        print('Register success');
      }
      user.value = result.data;
    } else {
      if (kDebugMode) {
        print(result.message);
      }
    }
  }

  void onGoogleSignIn() async {
    final result = await authRepository.signInWithGoogle();
    if (result is Success) {
      if (kDebugMode) {
        print('Google sign in success');
      }
      user.value = result.data;
    } else {
      if (kDebugMode) {
        print(result.message);
      }
    }
  }
}