import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/login_response.dart';
import 'package:coffee_bloom/model/refresh_response.dart';
import 'package:coffee_bloom/model/signup_response.dart';
import 'package:coffee_bloom/model/user_data.dart';
import 'package:coffee_bloom/service/auth_api_service.dart';
import 'package:coffee_bloom/service/auth_local_storage.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthApiService _apiService = AuthApiService();
  final AuthLocalStorage _authLocal = AuthLocalStorage();

  String? message;
  bool isLoading = false;
  SignupResponse? signupResponse;
  LoginResponse? loginResponse;
  RefreshTokenData? refreshTokenData;

  /// sign Up function
  Future<void> signUp({required Map<String, dynamic> data}) async {
    isLoading = true;
    message = null;
    notifyListeners();

    try {
      final response = await _apiService.callSignUpApi(
        data: data,
        endpoint: AppConstants.signUpEnd,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = SignupResponse.fromJson(response.data);
        if (parse.status == 1) {
          signupResponse = parse;

          final token = parse.data?.token;

          if (token != null) {
            await _authLocal.saveTokens(
              accessToken: token,
              refreshToken: token,
            );
          }

          message = response.data['message'];
          notifyListeners();
        } else {
          signupResponse = null;
          message = parse.message;
        }
      } else {
        message = response.data['message'];
        notifyListeners();
      }
    } on DioException catch (e) {
      message = e.response?.data;
    }
    isLoading = false;
    notifyListeners();
  }

  /// Login function
  Future<void> login({required Map<String, dynamic> data}) async {
    isLoading = true;
    message = null;
    notifyListeners();

    try {
      final response = await _apiService.callLoginApi(
        data: data,
        endpoint: AppConstants.loginEnd,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = LoginResponse.fromJson(response.data);

        if (parse.status != 1) {
          loginResponse = parse;

          final token = parse.data?.accessToken;

          if (token != null) {
            await _authLocal.saveTokens(
              accessToken: token,
              refreshToken: token,
            );
          }

          message = response.data['message'];
        } else {
          loginResponse = null;
          message = parse.message;
        }
      } else {
        message = response.data['message'];
      }
    } on DioException catch (e) {
      message = e.response?.data;
    }
    isLoading = false;
    notifyListeners();
  }

  /// refresh token function
  Future<RefreshTokenData?> refreshToken() async {
    try {
      final refreshToken = await _authLocal.getRefreshToken();

      if (refreshToken == null) return null;

      final response = await _apiService.callRefreshTokenApi(
        refreshToken: refreshToken,
        endpoint: AppConstants.refreshEnd,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = RefreshTokenData.fromJson(response.data);

        final String? newAccessToken = parse.refreshToken;

        if (newAccessToken != null) {
          await _authLocal.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newAccessToken,
          );
        }
        message = response.data['message'];
        notifyListeners();
      }
    } on DioException catch (e) {
      message = e.response?.data;
    }
    isLoading = false;
    notifyListeners();
    return null;
  }

  /// This is use to get access token
  Future<String?> getAccessToken() async {
    return await _authLocal.getAccessToken();
  }

  /// This is use to get refresh token
  Future<String?> getRefreshToken() async {
    return await _authLocal.getRefreshToken();
  }

  /// Log out function
  Future<void> logout(BuildContext context) async {
    await _authLocal.clearTokens();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (_) => false,
    );
  }

  /// It checks that is user already logged in?
  Future<bool> isLoggedIn() async {
    return await _authLocal.checkToken();
  }
}
