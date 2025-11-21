import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:task_planner/services/internet.dart';
import 'package:task_planner/shared/data/firebase/authetication.dart';
import 'package:task_planner/shared/providers/authentication_provider.dart';
import 'package:task_planner/shared/providers/user_auth_provider/user_auth_state.dart';

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
      if (e.code == 'invalid-credential') {
        errorMsg = 'Invalid credential';
      }
      state = AuthErrorState(errorMsg: errorMsg);
      return;
    }
    state = AuthSuccessState();
  }
}
