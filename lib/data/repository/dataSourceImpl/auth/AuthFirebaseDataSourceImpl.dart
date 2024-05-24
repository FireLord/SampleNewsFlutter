import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sample_news/data/repository/dataSource/auth/AuthFirebaseDataSource.dart';
import 'package:sample_news/data/util/Resource.dart';

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  final FirebaseAuth firebaseAuth;

  AuthFirebaseDataSourceImpl(this.firebaseAuth);

  @override
  Future<Resource<User>> registerWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return Success(userCredential.user!);
    } catch (e) {
      return Failure('Error registering user: $e');
    }
  }

  @override
  Future<Resource<User>> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Success(userCredential.user!);
    } catch (e) {
      return Failure('Error signing in user: $e');
    }
  }

  @override
  Future<Resource<User>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      final UserCredential userCredential = await firebaseAuth.signInWithCredential(authCredential);
      return Success(userCredential.user!);
    } catch (e) {
      return Failure('Error signing in with Google: $e');
    }
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }
}
