abstract class Network {
  String get baseUrl;

  Map<String, dynamic> get header;

  void updateHeader(Map<String, dynamic> data);

  Future getFromAPI(String endURL, {Map<String, dynamic>? queryParams});

  Future postToAPI(String endURL, dynamic data);
}
