import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth;

  FireAuth(this._firebaseAuth);

  bool get hasUser => _firebaseAuth.currentUser != null;

  User? getUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> refreshUser() async {
    return _firebaseAuth.currentUser?.reload();
  }

  Future<User?> signin(String username, String password) async {
    final res = await _firebaseAuth.signInWithEmailAndPassword(
      email: username,
      password: password,
    );
    return res.user;
  }

  Future<User?> signup(String username, String password) async {
    final res = await _firebaseAuth.createUserWithEmailAndPassword(
      email: username,
      password: password,
    );
    return res.user;
  }

  Future signout() async {
    await _firebaseAuth.signOut();
  }
}
