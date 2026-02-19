
import 'package:dio/dio.dart';

import '../helper/app_constants.dart';
import '../helper/helper.dart';
class ForgotApiService {
  Future<Response> callSendEmailApi({required Map<String, dynamic> data, required String endpoint}) async {
    try {
      final response = Global().dio.post(
        endpoint,
        data: data,
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
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    try {
      final response = await Global().dio.post(
        endpoint,
        data: data,
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
      {required Map<String, dynamic> data} ) async {
    try {
      final response = await Global().dio.post(
        AppConstants.resetPassEnd,
        data: data,
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