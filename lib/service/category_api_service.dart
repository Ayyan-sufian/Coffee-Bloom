import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/helper/helper.dart';
import 'package:dio/dio.dart';

class CategoryApiService {

  Future<Response> callCategoryApi({required String token}) async {
    try {
      final response = await Global().dio.get(
        AppConstants.categoryEnd,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
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

  Future<Response> callCategoryIdApi({required String token, required String id}) async {
    try {
      final endPoint = AppConstants.categoryIdEnd+id;
      final response = await Global().dio.get(
        endPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
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
