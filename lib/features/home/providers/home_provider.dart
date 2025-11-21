import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/shared/providers/network_providers.dart';

final homeProvider = FutureProvider<List<dynamic>>((ref) async {
  final network = ref.watch(networkProvider);
  final data = await network.getFromAPI();
  return Future.value(jsonDecode(data.body));
});
