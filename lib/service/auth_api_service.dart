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
    } catch (e) {
      throw Exception("This is  result : $e");
    }
  }

  Future<dynamic> callLoginApi({
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    try {
      final response = await Global().dio.post(data: data, endpoint);
      return response;
    } catch (e) {
      throw Exception("This is  result : $e");
    }
  }

  Future<Response> callRefreshTokenApi({required String refreshToken}) async {
    return await Global().dio.post(
      AppConstants.refreshEnd,
      data: {"refresh_Token": refreshToken},
    );
  }
}
