import 'package:coffee_bloom/helper/helper.dart';
import 'package:dio/dio.dart';

class CoffeeApiService {
  /// Coffee api
  Future<Response> callCoffeeApi({
    required String endpoint,
    required String token,
  }) async {
    try {
      final response = Global().dio.get(
        endpoint,
        options: Options(headers: {'Authorization': "Bearer $token"}),
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

  /// Order api
  Future<Response> callOrderApi({
    required Map<String, dynamic> data,
    required String endpoint,
    required String token,
  }) async {
    try {
      final response = await Global().dio.post(
        endpoint,
        data: data,
        options: Options(headers: {'Authorization': "Bearer $token"}),
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
