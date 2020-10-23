import 'package:twitter/services/app_storage.dart';

class Auth {
  AppStorage _storage;

  Auth() {
    _storage = AppStorage();
  }

  Future<bool> isLoggedIn() async {
    return (await _storage.getJwtToken() != null);
  }
}
