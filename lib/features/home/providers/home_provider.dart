import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/features/home/data/home_repo.dart';
import 'package:task_planner/features/home/data/home_repo_imp.dart';
import 'package:task_planner/shared/providers/network_providers.dart';

final homeDataProvider = Provider<HomeRepository>((ref) {
  final network = ref.watch(networkProvider);
  final homeRepo = HomeRepositoryImp(network);
  return homeRepo;
});

final homeProvider = FutureProvider<List<dynamic>>((ref) async {
  final homeRepo = ref.watch(homeDataProvider);
  final data = await homeRepo.getTaskItems("Products");
  return Future.value(data);
});
