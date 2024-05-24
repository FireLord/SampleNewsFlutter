import 'package:firebase_auth/firebase_auth.dart';

import '../../data/util/Resource.dart';

abstract class AuthRepository {
  Future<Resource<User>> signInWithEmailAndPassword(String email, String password);
  Future<Resource<User>> signInWithGoogle();
  Future<void> signOut();
  Future<Resource<User>> registerWithEmailAndPassword(String email, String password);
}