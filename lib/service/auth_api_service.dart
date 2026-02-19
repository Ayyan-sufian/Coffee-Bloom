import 'package:coffee_bloom/helper/helper.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  Future<Response> callSignUpApi({
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
    } catch (e) {
      throw Exception("Sign up failed: $e");
    }
  }

  Future<Response> callLoginApi({
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
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  Future<Response> callRefreshTokenApi({required String refreshToken, required String endpoint}) async {
    try {
      final response = await Global().dio.post(
        endpoint,
        data: {"refresh_Token": refreshToken},
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      );
    } catch (e) {
      throw Exception("Refresh token failed: $e");
    }
  }
}