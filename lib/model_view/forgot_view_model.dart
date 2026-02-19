import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/forget_response.dart';
import 'package:coffee_bloom/model/reset_pass_response.dart';
import 'package:coffee_bloom/model/verify_response.dart';
import 'package:coffee_bloom/service/forgot_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ForgotViewModel extends ChangeNotifier {
  final ForgotApiService _forgotApiService = ForgotApiService();

  bool isLoading = false;
  String? error;
  ForgetResponse? forgetResponse;
  VerifyResponse? verifyResponse;
  ResetPassResponse? resetPassResponse;

  Future<void> sendEmail({required Map<String, dynamic> data}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _forgotApiService.callSendEmailApi(data: data, endpoint: AppConstants.forgotPassEnd);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ForgetResponse.fromJson(response.data);

        if (parse.rescode == 1) {
          forgetResponse = parse;
        } else {
          error = parse.message;
          forgetResponse = null;
        }
      } else {
        error = AppConstants.invalidResTxt;

      }
    } on DioException catch (e) {
      error =
          e.response?.data?['message'] ??
          e.message ??
          AppConstants.ssSomeErrorTxt;

    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOtp({required Map<String, dynamic> data}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _forgotApiService.callVerifyApi(
        data: data,
        endpoint: AppConstants.verifyEnd
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = VerifyResponse.fromJson(response.data);

        if (parse.rescode == 1) {
          verifyResponse = parse;
        } else {
          error = parse.message;
         verifyResponse = null;
        }
      } else {
        error = "Invalid otp";
      }
    } on DioException catch (e) {
      error =
          e.response?.data?['message'] ??
          e.message ??
          AppConstants.ssSomeErrorTxt;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPass({required Map<String, dynamic> data}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _forgotApiService.callResetPassApi(data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ResetPassResponse.fromJson(response.data);
        if (parse.rescode == 1) {
          resetPassResponse = parse;
        } else {
          resetPassResponse = null;
          error = parse.message;
        }
      } else {
        error = response.data?['message'] ?? AppConstants.restPassFailedTxt;
      }
    } on DioException catch (e) {
      error =
          e.response?.data?['message'] ??
          e.message ??
          AppConstants.ssSomeErrorTxt;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
