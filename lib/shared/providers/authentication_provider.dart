import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/shared/data/firebase/authetication.dart';

final fireAuthProvider = Provider<FireAuth>((ref) {
  final firebathAuth = FirebaseAuth.instance;
  return FireAuth(firebathAuth);
});
