import 'package:task_planner/features/home/data/home_repo.dart';
import 'package:task_planner/shared/data/remote/network_service_imp.dart';

class HomeRepositoryImp extends HomeRepository {
  NetworkService networkService;
  HomeRepositoryImp(this.networkService);

  @override
  Future<dynamic> addTaskItems() async {}

  @override
  Future<dynamic> getTaskItems(String endUrl) async {
    final data = await networkService.getFromAPI(endUrl);
    print(data);
    return data;
  }
}
