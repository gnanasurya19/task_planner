import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InternetService {
  Future<bool> checkNetwork() async {
    List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    if (result.any((element) => element == ConnectivityResult.none)) {
      throw false;
    } else {
      return true;
    }
  }
}

final internetProvider = Provider<InternetService>((ref) => InternetService());
