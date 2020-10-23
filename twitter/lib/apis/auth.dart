import 'package:twitter/services/api/api.dart';
import 'package:http/http.dart' as http;

class Auth {
  Api api;

  //construct
  Auth() {
    api = Api();
  }

  Future<http.Response> login(String email, String password) {
    return api.post('/auth/login', {'email': email, 'password': password});
  }

  Future<http.Response> register(String email, String password, String fullname) {
    return api.post('/auth/register', {'email': email, 'password': password, 'full_name': fullname});
  }

  Future<http.Response> forgot(String email) {
    return api.post('/auth/forgot', {'email': email});
  }

  Future<http.Response> active(String code) {
    return api.post('/auth/forgot', {'code': code});
  }

  Future<http.Response> changePassword(String code, String password) {
    return api.post('/auth/change-password', {'code': code, 'password': password});
  }

  Future<http.Response> refreshToken(String refreshToken) {
    return api.post('/auth/refresh-token', {'refresh-token': refreshToken});
  }
}
