import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/shared/providers/authentication_provider.dart';

final usercacheProvider = FutureProvider<bool>((ref) async {
  final response = ref.watch(fireAuthProvider);
  await response.refreshUser();
  return response.hasUser;
});
