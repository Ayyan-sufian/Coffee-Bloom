import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/forget_response.dart';
import 'package:coffee_bloom/model/login_response.dart';
import 'package:coffee_bloom/model/reset_pass_response.dart';
import 'package:coffee_bloom/model_view/auth_view_model.dart';
import 'package:coffee_bloom/service/auth_api_service.dart';
import 'package:coffee_bloom/service/auth_local_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ForgotViewModel extends ChangeNotifier {
  final AuthApiService _authService = AuthApiService();
  final AuthLocalStorage _authStorage = AuthLocalStorage();

  bool isLoading = false;
  String? Error;
  ForgetResponse? forgetResponse;
  ResetPassResponse? resetPassResponse;

  Future<bool> sendEmail(String email) async {
    isLoading = true;
    Error = null;
    notifyListeners();

    try {
      final response = await _authService.callSendEmailApi(email: email);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ForgetResponse.fromJson(response.data);

        if (parse.rescode == 1) {
          forgetResponse = parse;
          return true;
        } else {
          Error = parse.message;
          return false;
        }
      } else {
        Error = "Invalid response";
        return false;
      }
    } on DioException catch (e) {
      Error =
          e.response?.data?['message'] ?? e.message ?? AppConstants.ssSomeErrorTxt;
      return false;
    } catch (e) {
      Error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp(String email, String code) async {
    isLoading = true;
    Error = null;
    notifyListeners();

    try {
      final response = await _authService.callVerifyApi(
        email: email,
        code: code,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ForgetResponse.fromJson(response.data);

        if (parse.rescode == 1) {
          forgetResponse = parse;
          return true;
        } else {
          Error = parse.message;
          return false;
        }
      } else {
        Error = "Invalid otp";
        return false;
      }
    } on DioException catch (e) {
      Error =
          e.response?.data?['message'] ?? e.message ?? AppConstants.ssSomeErrorTxt;
      return false;
    } catch (e) {
      Error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> resetPass(String email, String pass, String confirmPass) async {
    if (pass != confirmPass) {
      Error = "Password and Confirm Password do not match";
      notifyListeners();
      return false;
    }
    
    isLoading = true;
    Error = null;
    notifyListeners();

    try {
      final response = await _authService.callResetPassApi(
        email: email,
        pass: pass,
        confirmPass: confirmPass,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ResetPassResponse.fromJson(response.data);
        if (parse.rescode == 1) {
          resetPassResponse = parse;
          return true;
        } else {
          Error = parse.message;
          return false;
        }
      } else {
        Error = response.data?['message'] ?? "Reset password failed";
        return false;
      }
    } on DioException catch (e) {
      Error = e.response?.data?['message'] ?? e.message ?? AppConstants.ssSomeErrorTxt;
      return false;
    } catch (e) {
      Error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
