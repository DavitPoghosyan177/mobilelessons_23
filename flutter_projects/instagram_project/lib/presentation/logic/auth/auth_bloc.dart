import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_project/domin/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepositories) : super(const AuthInitial()) {
    on<SignOutEvent>(_mapSignOutEventToState);
    on<SignInWithGoogleEvent>(_mapSignInWithGoogleEventToState);
  }
  final AuthRepository authRepositories;

  FutureOr<void> _mapSignInWithGoogleEventToState(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthUserLoading());
      final UserCredential userCredential =
          await authRepositories.signInWithGoogle();
      emit(AuthUserLoaded(
          userCredential.user?.uid ?? '',
          userCredential.user?.displayName ?? '',
          userCredential.user?.email ?? '',
          userCredential.user?.photoURL ?? ''));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateFailed(e.message ?? e.code));
    } catch (e) {
      emit(AuthStateFailed(e.toString()));
    }
  }

  FutureOr<void> _mapSignOutEventToState(
      SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthUserLoading());
      await authRepositories.signOut();
      emit(AuthStateSignedOut());
    } on FirebaseAuthException catch (e) {
      emit(AuthStateFailed(e.message ?? e.code));
    } catch (e) {
      emit(AuthStateFailed(e.toString()));
    }
  }
}
