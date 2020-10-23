import 'package:shared_preferences/shared_preferences.dart';

/**
 * store key-value to disk
 */
class AppStorage {
  Future<SharedPreferences> _prefs;
  final String _refreshToken = 'refreshToken';
  final String _jwtToken = 'jwtToken';

  AppStorage() {
    _prefs = SharedPreferences.getInstance();
  }

  Future<String> getRefreshToken() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(_refreshToken);
  }

  Future<String> getJwtToken() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(_jwtToken);
  }

  Future<void> setJwtToken(String token) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString(_jwtToken, token);
  }

  Future<void> removeJwtToken() async {
    SharedPreferences prefs = await _prefs;
    await prefs.remove(_jwtToken);
  }

  Future<void> setRefreshToken(String token) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString(_refreshToken, token);
  }
}
