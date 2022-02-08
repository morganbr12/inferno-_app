import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  late final FirebaseAuth _firebaseAuth;

  AuthenticationServices(FirebaseAuth instance);
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
