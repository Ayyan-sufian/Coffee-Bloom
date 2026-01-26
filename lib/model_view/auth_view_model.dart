import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/login_response.dart';
import 'package:coffee_bloom/model/signup_response.dart';
import 'package:coffee_bloom/service/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthApiService _authService = AuthApiService();

  bool isLoading = false;
  SignupResponse? signupResponse;
  LoginResponse? loginResponse;
  String? error;

  Future<void> signUp(Map<String, dynamic> data) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _authService.callSignUpApi(
        data: data,
        endPoint: AppConstants.signUpEnd,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parsed = SignupResponse.fromJson(response.data);
        if (parsed.rescode == 1) {
          signupResponse = parsed;
        } else {
          error = parsed.message;
          signupResponse = null;
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

  Future<void> login({
    required Map<String, dynamic> data,
  }) async {
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
}
