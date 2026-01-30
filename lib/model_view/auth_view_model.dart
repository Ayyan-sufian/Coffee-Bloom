import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/login_response.dart';
import 'package:coffee_bloom/model/refresh_response.dart';
import 'package:coffee_bloom/model/signup_response.dart';
import 'package:coffee_bloom/service/auth_api_service.dart';
import 'package:coffee_bloom/service/auth_local_storage.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthApiService _authService = AuthApiService();
  final AuthLocalStorage _authLocalStorage = AuthLocalStorage();

  bool isLoading = false;
  SignupResponse? signupResponse;
  LoginResponse? loginResponse;
  String? error;

  /// Sign Up
  Future<void> signUp(Map<String, dynamic> data) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _authService.callSignUpApi(
        data: data,
        endPoint: AppConstants.signUpEnd,
      );

      final parsed = SignupResponse.fromJson(response.data);

      if (parsed.rescode == 1) {
        signupResponse = parsed;
      } else {
        signupResponse = null;
        error = parsed.message;
      }
    } on DioException catch (e) {
      debugPrint("DIO ERROR: ${e.response?.data}");
      error = e.response?.data?['message'] ?? 'Invalid signup data';
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  /// Login
  Future<void> login({required Map<String, dynamic> data}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _authService.callLoginApi(
        data: data,
        endpoint: AppConstants.loginEnd,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parsed = LoginResponse.fromJson(response.data);
        if (parsed.rescode == 1) {
          loginResponse = parsed;

          await _authLocalStorage.saveTokens(
            accessToken: parsed.data!.token,
            refreshToken: '',
          );
        } else {
          error = parsed.message;
          loginResponse = null;
        }
      } else {
        error = 'Signup failed with status ${response.statusCode}';
      }
    } on DioException catch (e) {
      error =
          e.response?.data?['message'] ?? e.message ?? 'Something went wrong';
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  /// Refresh Token
  Future<RefreshResponse?> refreshTokenApi(String refreshToken) async {
    try {
      final refreshToken = await _authLocalStorage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) return null;
      final response = await _authService.callRefreshTokenApi(
        refreshToken: refreshToken,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parsed = RefreshResponse.fromJson(response.data);

        if (parsed.accessToken != null) {
          await _authLocalStorage.saveTokens(
            accessToken: parsed.accessToken!,
            refreshToken: refreshToken,
          );
          return parsed;
        }
      }
    } catch (_) {}
    return null;
  }

  /// Log out
  Future<void> logout(BuildContext context) async {
    await _authLocalStorage.clearTokens();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (_) => false,
    );
  }

  /// Is Logged In checker
  Future<bool> isLoggedIn() async {
    return await _authLocalStorage.isLoggedIn();
  }
}
