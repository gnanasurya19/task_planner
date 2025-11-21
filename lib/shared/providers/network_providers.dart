import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/shared/data/remote/network_service_imp.dart';

final networkProvider = Provider<NetworkService>((ref) {
  final network = NetworkService();
  return network;
});
