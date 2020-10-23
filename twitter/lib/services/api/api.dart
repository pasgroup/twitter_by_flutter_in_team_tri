import 'package:twitter/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> get(String path) async {
    return await http.get("$apiUrl$path");
  }

  Future<http.Response> post(String path, Map body) async {
    http.Response response = await http.post("$apiUrl$path", body: body);
    return response;
  }
}
