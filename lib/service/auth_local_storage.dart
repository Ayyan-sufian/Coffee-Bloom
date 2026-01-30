import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
   static const _accessTokenKey = 'access_token';
   static const _refreshTokenKey = 'refresh_token';

   Future<void> saveTokens({
     required String accessToken,
     required String refreshToken
}) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.setString(_accessTokenKey, accessToken);
     await prefs.setString(_refreshTokenKey, refreshToken);
   }

   Future<String?> getAccessToken() async {
     final prefs = await SharedPreferences.getInstance();
     return prefs.getString(_accessTokenKey);
   }

   Future<String?> getRefreshToken() async{
     final prefs = await SharedPreferences.getInstance();
     return prefs.getString(_refreshTokenKey);
   }

   Future<void> clearTokens() async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.remove(_accessTokenKey);
     await prefs.remove(_refreshTokenKey);
   }

   Future<bool> isLoggedIn() async{
     final prefs = await SharedPreferences.getInstance();
     return prefs.containsKey(_accessTokenKey);
   }
}