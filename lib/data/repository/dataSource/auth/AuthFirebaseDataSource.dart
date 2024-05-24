import 'package:firebase_auth/firebase_auth.dart';
import '../../../util/Resource.dart';

abstract class AuthFirebaseDataSource {
  Future<Resource<User>> signInWithEmailAndPassword(String email, String password);
  Future<Resource<User>> signInWithGoogle();
  Future<void> signOut();
  Future<Resource<User>> registerWithEmailAndPassword(String email, String password);
}