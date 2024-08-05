import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
 Future<void> signOut();
  Future<UserCredential> signInWithGoogle();
}