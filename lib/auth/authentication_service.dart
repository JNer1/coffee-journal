import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print('${_firebaseAuth.currentUser?.uid}');
      return 'Logged in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> register(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Registered';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
