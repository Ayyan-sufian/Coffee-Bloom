import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/forget_response.dart';
import 'package:coffee_bloom/model/reset_pass_response.dart';
import 'package:coffee_bloom/service/forgot_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ForgotViewModel extends ChangeNotifier {
  final ForgotApiService _forgotApiService = ForgotApiService();

  bool isLoading = false;
  String? error;
  ForgetResponse? forgetResponse;
  ResetPassResponse? resetPassResponse;

  Future<bool> sendEmail(String email) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _forgotApiService.callSendEmailApi(email: email);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ForgetResponse.fromJson(response.data);

        if (parse.rescode == 1) {
          forgetResponse = parse;
          return true;
        } else {
          error = parse.message;
          return false;
        }
      } else {
        error = "Invalid response";
        return false;
      }
    } on DioException catch (e) {
      error =
          e.response?.data?['message'] ?? e.message ?? AppConstants.ssSomeErrorTxt;
      return false;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp(String email, String code) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _forgotApiService.callVerifyApi(
        email: email,
        code: code,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ForgetResponse.fromJson(response.data);

        if (parse.rescode == 1) {
          forgetResponse = parse;
          return true;
        } else {
          error = parse.message;
          return false;
        }
      } else {
        error = "Invalid otp";
        return false;
      }
    } on DioException catch (e) {
      error =
          e.response?.data?['message'] ?? e.message ?? AppConstants.ssSomeErrorTxt;
      return false;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> resetPass(String email, String pass, String confirmPass) async {
    if (pass != confirmPass) {
      error = "Password and Confirm Password do not match";
      notifyListeners();
      return false;
    }
    
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _forgotApiService.callResetPassApi(
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
          error = parse.message;
          return false;
        }
      } else {
        error = response.data?['message'] ?? "Reset password failed";
        return false;
      }
    } on DioException catch (e) {
      error = e.response?.data?['message'] ?? e.message ?? AppConstants.ssSomeErrorTxt;
      return false;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
