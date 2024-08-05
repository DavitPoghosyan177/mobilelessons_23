import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_project/domin/repositories/auth_repository.dart';

import '../services/auth_service/auth_service.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImp({required this.authService});

  @override
  Future<UserCredential> signInWithGoogle() async {
    return authService.signInWithGoogle();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
