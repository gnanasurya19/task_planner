import 'package:http/http.dart' as http;

class NetworkService {
  String get baseUrl => "";

  Future getFromAPI() async {
    return await http.get(Uri.parse("https://fakestoreapi.com/products"));
  }
}
