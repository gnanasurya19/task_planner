import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/shared/data/local/shared_pref.dart';

final sharesprefProvider = Provider<SharedPref>((ref) {
  SharedPref sharedPreference = SharedPref();
  sharedPreference.init();
  return sharedPreference;
});
