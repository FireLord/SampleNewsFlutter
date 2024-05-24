import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_news/data/repository/dataSource/auth/AuthFirebaseDataSource.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDataSource authFirebaseDataSource;

  AuthRepositoryImpl(this.authFirebaseDataSource);

  @override
  Future<Resource<User>> registerWithEmailAndPassword(String email, String password) {
    return authFirebaseDataSource.registerWithEmailAndPassword(email, password);
  }

  @override
  Future<Resource<User>> signInWithEmailAndPassword(String email, String password) {
    return authFirebaseDataSource.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<Resource<User>> signInWithGoogle() {
    return authFirebaseDataSource.signInWithGoogle();
  }

  @override
  Future<void> signOut() {
    return authFirebaseDataSource.signOut();
  }
}