import 'dart:io';

import 'package:twitter/constants.dart';
import 'package:twitter/services/app_storage.dart';
import 'package:http/http.dart' as http;

class LoggedInApi {
  AppStorage storage;

  LoggedInApi() {
    storage = AppStorage();
  }

  Future<http.Response> get(String path) async {
    return await http.get("$apiUrl$path", headers: await _getHeader());
  }

  Future<http.Response> post(String path, Map body) async {
    http.Response response = await http.post("$apiUrl$path", body: body, headers: await _getHeader());
    return response;
  }

  Future<dynamic> _getHeader() async {
    String token = 'Bearer ' + await storage.getJwtToken();
    return {HttpHeaders.authorizationHeader: token};
  }
}
