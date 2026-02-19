import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  
  SharedPreferences? _prefs;
  
  Future<SharedPreferences> get _preferences async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final prefs = await _preferences;
   await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<String?> getAccessToken() async {
    final prefs = await _preferences;
    final accessToken =  prefs.getString(_accessTokenKey);
    return accessToken;
  }

  Future<String?> getRefreshToken() async {
    final prefs = await _preferences;
    final refreshToken = prefs.getString(_refreshTokenKey);
    return refreshToken;
  }

  Future<void> clearTokens() async {
    final prefs = await _preferences;
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }

  Future<bool> checkToken() async {
    final pref = await _preferences;
    final String? token = pref.getString(_accessTokenKey);
    final bool isLoggedIn = token != null && token.trim().isNotEmpty;
    return isLoggedIn;
  }
}