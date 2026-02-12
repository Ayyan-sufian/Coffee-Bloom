
import 'package:dio/dio.dart';

import '../helper/app_constants.dart';
import '../helper/helper.dart';
class ForgotApiService {
  Future<Response> callSendEmailApi({required String email}) async {
    try {
      final response = Global().dio.post(
        AppConstants.forgotPassEnd,
        data: {"email": email},
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      );
    }
  }

  Future<Response> callVerifyApi({
    required String email,
    required String code,
  }) async {
    try {
      final response = await Global().dio.post(
        AppConstants.verifyEnd,
        data: {"email": email, "otp": code},
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      );
    }
  }

  Future<Response> callResetPassApi(
      {required String email, required String pass, required String confirmPass}) async {
    try {
      final response = await Global().dio.post(
        AppConstants.resetPassEnd,
        data: {
          "email": email,
          "password": pass,
          "confirmPassword": confirmPass,
        },
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      );
    }
  }
}