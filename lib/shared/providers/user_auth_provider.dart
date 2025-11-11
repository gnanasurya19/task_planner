import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:task_planner/services/internet.dart';
import 'package:task_planner/shared/data/firebase/authetication.dart';
import 'package:task_planner/shared/providers/authentication_provider.dart';

sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String errorMsg;

  AuthErrorState({required this.errorMsg});
}

final class AuthNoInternet extends AuthState {}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final FireAuth fireAuth = ref.watch(fireAuthProvider);
  final internet = ref.watch(internetProvider);
  return AuthNotifier(AuthInitialState(), fireAuth, internet);
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(super.state, this._fireAuth, this._internetService);

  final FireAuth _fireAuth;
  final InternetService _internetService;

  login(String email, String password) async {
    if (await _internetService.checkNetwork() == false) {
      state = AuthNoInternet();
      return;
    }
    state = AuthLoadingState();
    try {
      await _fireAuth.signin(email, password);
    } on FirebaseException catch (e) {
      var errorMsg = '';
      print(e.code);
      if (e.code == 'invalid-credential') {
        errorMsg = 'Invalid credential';
      }
      state = AuthErrorState(errorMsg: errorMsg);
      return;
    }
    state = AuthSuccessState();
  }
}
