import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/helper/helper.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  Future<dynamic> callSignUpApi({
    required Map<String, dynamic> data,
    required String endPoint,
  }) async {
    try {
      final response = await Global().dio.post(data: data, endPoint);
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      );
    } catch (e) {
      throw Exception("Sign up failed: $e");
    }
  }

  Future<dynamic> callLoginApi({
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    try {
      final response = await Global().dio.post(data: data, endpoint);
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      );
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  Future<Response> callRefreshTokenApi({required String refreshToken}) async {
    return await Global().dio.post(
      AppConstants.refreshEnd,
      data: {"refresh_Token": refreshToken},
    );
  }

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
}
